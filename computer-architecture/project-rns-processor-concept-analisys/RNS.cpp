//1.
// Created by marcin on 26.05.18.
//

#include <cstdio>
#include <iostream>
#include <iomanip>
#include <stack>
#include <vector>
#include <cmath>

class RNS{
public:
    // constructors
    // parameter as machine value
    RNS(long long a){
        if(a == 0){
            for(int i = 0; i < M_SIZE; i++)
                x[i] = 0;
            return;
        }
        else if(a < 0) a = 0;
        else {
            if(a > Ry) a = Ry;
            for(int i = 0; i < M_SIZE; i++)
                x[i] = MOD(a, M[i]);
        }
    }

    // fills data with 0
    RNS(){
        for(int i = 0; i < M_SIZE; i++)
            x[i] = 0;
    }

    // parameter as interpreted number
    RNS(double d){
        // create machine value
        long long a = (long long) (d*Rf)+0.5f;
        if(a == 0){
            for(int i = 0; i < M_SIZE; i++)
                x[i] = 0;
            return;
        }
        else if(a < 0) a = 0;
        else {
            if(a > Ry) a = Ry;
            for(int i = 0; i < M_SIZE; i++)
                x[i] = MOD(a, M[i]);
        }
    }

    // operators
    RNS operator + (RNS b){
        for(int i = 0; i < M_SIZE; i++)
            b.x[i] = MOD(x[i] + b.x[i], M[i]);
        return b;
    }

    RNS operator - (RNS b){
        for(int i = 0; i < M_SIZE; i++)
            b.x[i] = MOD(x[i] - b.x[i], M[i]);
        return b;
    }

    RNS operator * (RNS b){
        // calculate intermediate product
        for(int i = 0; i < M_SIZE; i++){
            b.x[i] = MOD(x[i] * b.x[i], M[i]);
        }
        RNS ret((long long) 0);
        // convert to mixed-radix
        std::stack<int> LIFO = MRC(b, M_SIZE-1);
        // convert back ignoring fractional numbers
        while(LIFO.size() > 2*(M_SIZE-fract_pos)){
            int d = LIFO.top();
            LIFO.pop();
            for(int i = 0; i < M_SIZE; i++)
                ret.x[i] = MOD(ret.x[i] + d, M[i]);
            if(LIFO.size() <= 2*(M_SIZE-fract_pos))
                break;
            int m = LIFO.top();
            LIFO.pop();
            for(int i = 0; i < M_SIZE; i++)
                ret.x[i] = MOD(ret.x[i] * m, M[i]);
        }
        // calculate roundup
        int buf = 0;
        if(!LIFO.empty()) LIFO.pop();
        int size = LIFO.size();
        while(!LIFO.empty()){
            int d = LIFO.top();
            LIFO.pop();
            buf += d;
            if(LIFO.empty())
                break;
            int m = LIFO.top();
            LIFO.pop();
            buf *= m;
        }
        // increment if needed to roundup
        if(buf >= Rf/2)
            for(int i = 0; i < M_SIZE; i++)
                ret.x[i] = MOD(ret.x[i]+1, M[i]);
        return ret;
    }

    RNS operator / (RNS b){

        /*
         *  Goldschmidt division used:
         *  divisor D and dividend N are multiplied by factor fi = 2-D
         *  until N from previous iteration is equal to current iteration
         *
         *  To perform fast division it's necessary to scale divisor 0.5 <= D <= 1
         */

        RNS dividend = *this;
        RNS divisor = b;

        // divide by 0
        if(b == 0)
            return RNS(Ry);

        // scale divisor and dividend
        scale(dividend, divisor);
        int t = dividend.normal_power - dividend.power; // number of truncated powers

        // value of two in scaled rns
        RNS two(2*dividend.Rf);
        two.fract_pos = dividend.fract_pos;
        two.Rf = dividend.Rf;

        // set scaled RNS result number
        RNS result = RNS((long long)1);
        result.fract_pos = dividend.fract_pos;
        update_power(result, dividend.power);

        // set scaled RNS previous result number
        RNS result_prev = RNS();
        result_prev.fract_pos = dividend.fract_pos;
        update_power(result_prev, dividend.power);

        // set scaled RNS multiplication factor
        RNS Fi = two-divisor;
        Fi.fract_pos = dividend.fract_pos;
        update_power(Fi, dividend.power);

        // division loop
        while(result != result_prev){
            // previous result is stored
            result_prev = result;
            // update multiplication factor
            Fi = two-divisor;
            // multiply dividend and divisor by multiplication factor
            dividend = dividend * Fi;
            divisor = divisor * Fi;
            // current result is stored
            result = dividend;
        }
        // after division, result needs to be re-normalized
        RNS ret = RNS((double)result);

        return ret;
    }

    // helpers
    bool operator != (int a) {
        RNS tmp((long long)a);
        update_power(tmp, power);
        for(int i = 0; i < M_SIZE; i++)
            if(x[i] != tmp.x[i] && x[i] != -1)
                return true;
        return false;
    }
    bool operator == (int a) {
        RNS tmp((long long)a);
        for(int i = 0; i < M_SIZE; i++)
            if(x[i] != tmp.x[i] && x[i] != -1)
                return false;
        return true;
    }
    bool operator == (RNS rns2) {
        for(int i = 0; i < M_SIZE; i++)
            if(x[i] != rns2.x[i] && x[i] != -1)
                return false;
        return true;
    }
    bool operator != (RNS rns2) {
        for(int i = 0; i < M_SIZE; i++)
            if(x[i] != rns2.x[i] && x[i] != -1)
                return true;
        return false;
    }
    bool operator > (RNS rns2) {
        if(compare(*this, rns2) == 1) return true;
        else return false;

    }

    // print operator
    friend std::ostream& operator << (std::ostream& os, RNS& rns){
        for(int i = 0; i < rns.M_SIZE; i++)
            os << std::setw(3) << rns.x[i];
        return os << std::endl;
    }

    // reverse conversion
    operator double(){
        RNS rns = *this;
        // convert to mixed-radix
        std::stack<int> LIFO = MRC(rns, M_SIZE-1);
        // convert to decimal
        double ret = mr_to_decimal(LIFO);
        // divide by fractional range
        return ret / Rf;
    }
    RNS& operator = (RNS rns){
        for(int i = 0; i < M_SIZE; i++)
            x[i] = rns.x[i];
    }
private:
    // modulus
    static const int M_SIZE = 7+4+7;
        // base modulus
    //const int BM[M_SIZE] = {61, 59, 53, 47, 43, 41, 37, 31, 29, 23, 19, 17, 13, 11, 7, 5, 3, 2};

        // full digit modulus
    static const int normal_power = 6;  // normal power of modulus 2
    int power = normal_power;   // power of modulus 2 can change after scaling
    int M[M_SIZE] = {61, 59, 53, 47, 43, 41, 37, 31, 29, 23, 19, 17, 13, 11, 7, 5, 3, (int)pow(2, power)};

    int fract_pos = M_SIZE-F; // fractional point position (necessary for scaling)
    static const int F = 7; // nr of fractional digits
    static const int W = 4; // nr of whole digits
    static const int E = 7; // nr of extended digits
    long long Rf = get_Rf();  // fractional range
    long long Rw = get_Rw();  // whole range
    long long Ry = Rw*Rf;     // rns range

    // scaling operands for division
    void scale(RNS& dividend, RNS& divisor){
        int i = M_SIZE-1;
        RNS accum = divisor;
        int tmp;
        while(accum != 0){
            i--;
            tmp = accum.x[M_SIZE-1];
            int di = accum.x[i];
            if(di != 0) {
                accum.x[M_SIZE-1] = MOD(accum.x[M_SIZE-1] - di, accum.M[M_SIZE-1]);
                for (int j = i; j >= 0; j--)
                    accum.x[j] = MOD(accum.x[j] - di, M[j]);
            }
            int mi = accum.M[i];
            accum.x[M_SIZE-1] = MOD(accum.x[M_SIZE-1] * mod_inverse(mi, accum.M[M_SIZE-1]), accum.M[M_SIZE-1]);
            int mod_inv = mod_inverse(mi, accum.M[M_SIZE-1]);
            for(int j = i; j >= 0; j--)
                accum.x[j] = MOD(accum.x[j] * mod_inverse(mi, M[j]), M[j]);
        }
        i = M_SIZE-1-i;
        while(i < F){
            int m = M[M_SIZE-i-1];
            for(int j = 0; j < M_SIZE; j++){
                divisor.x[j] = MOD(divisor.x[j]*M[M_SIZE-i-1], M[j]);
                dividend.x[j] = MOD(dividend.x[j]*M[M_SIZE-i-1], M[j]);
            }
            i++;
        }
        dividend.fract_pos = M_SIZE-i;
        divisor.fract_pos = M_SIZE-i;
        int pwr = (int)log2(tmp)+1;
        update_power(dividend, pwr);
        update_power(divisor, pwr);
    }

    void update_power(RNS& rns, int pwr){
        rns.power = pwr;
        rns.M[M_SIZE-1] = pow(2,pwr);
        rns.Rf = rns.get_Rf();
        rns.x[M_SIZE-1] = MOD(rns.x[M_SIZE-1], rns.M[M_SIZE-1]);
    }
    // modular multiplicative inverse
    static int mod_inverse(int a, int mod){
        a = a%mod;
        if(a != 0){
            for (int i = 1; i < mod; i++)
                if ((a*i) % mod == 1)
                    return i;
        } else return -1;
    }

    // mixed radix conversion
    std::stack<int> MRC(RNS b, int i){
        std::stack<int> LIFO;
        while(b != 0 && i >= 0){
            if(b.x[i] == -1){
                b.x[i] = 0;
                i--;
                continue;
            }
            LIFO.push(b.x[i]);
            if(LIFO.top() != 0)
                for(int j = i; j >= 0; j--)
                    if(b.x[j] != -1)
                        b.x[j] = MOD(b.x[j] - LIFO.top(), M[j]);
            if(b == 0)
                break;
            LIFO.push(M[i]);
            for(int j = i; j >= 0; j--){
                if(b.x[j] != -1)
                    b.x[j] = MOD(b.x[j] * mod_inverse(LIFO.top(), M[j]), M[j]);
            }
            i--;
        }
        return LIFO;
    }

    // method used in compare operators
    int compare(RNS rns1, RNS rns2) {
        int i = M_SIZE-1;
        /* return value
         * 0:   rns1 = rns2,
         * 1:   rns1 > rns2,
         * -1:  rns1 < rns2
         */
        int ret = 0;
        while (rns1 != 0 || rns2 != 0) {
            int d1, d2;
            d1 = rns1.x[i];
            if (d1 != 0)
                for (int j = i; j >= 0; j--)
                    if (rns1.x[j] != -1)
                        rns1.x[j] = MOD(rns1.x[j] - d1, M[j]);
            d2 = rns2.x[i];
            if (d2 != 0)
                for (int j = i; j >= 0; j--)
                    if (rns2.x[j] != -1)
                        rns2.x[j] = MOD(rns2.x[j] - d2, M[j]);
            if(d1 > d2) ret = 1;
            else if(d1 < d2) ret = -1;
            if (rns1 == 0 || rns2 == 0)
                break;
            for (int j = i; j >= 0; j--) {
                rns1.x[j] = MOD(rns1.x[j] * mod_inverse(M[i], M[j]), M[j]);
                rns2.x[j] = MOD(rns2.x[j] * mod_inverse(M[i], M[j]), M[j]);
            }
            i--;
        }
        if(rns1 == 0 && rns2 == 0) return ret;
        else return rns1 == 0 ? -1 : 1;
    }

    // mixed radix to decimal
    double mr_to_decimal(std::stack<int> LIFO){
        double ret = 0;
        while(!LIFO.empty()){
            ret += LIFO.top();
            LIFO.pop();
            if(LIFO.empty())
                break;
            ret *= LIFO.top();
            LIFO.pop();
        }
        return ret;
    }

    // base extention method used in division
    void base_extend(RNS& rns) {
        std::stack<int> LIFO = MRC(rns, M_SIZE-1);
        RNS ret = RNS();
        while(!LIFO.empty()){
            int d = LIFO.top();
            LIFO.pop();
            for(int i = 0; i < M_SIZE; i++)
                ret.x[i] = MOD(ret.x[i] + d, M[i]);
            if(LIFO.empty())
                break;
            int m = LIFO.top();
            LIFO.pop();
            for(int i = 0; i < M_SIZE; i++)
                ret.x[i] = MOD(ret.x[i] * m, M[i]);
        }
        rns = ret;
    }

    // modulo operation working for negative numbers
    static int MOD(long a, long b){
        if(b != 0)
            return (a%b+b)%b;
        else return 0;
    }

    const long long get_Rf(){
        long long ret = 1;
        for(int i = M_SIZE-1; i >= fract_pos; i--)
            ret *= M[i];
        return ret;
    }
    const long long get_Rw(){
        long long ret = 1;
        for(int i = M_SIZE-1-F; i >= M_SIZE-F-W; i--)
            ret *= M[i];
        return ret;
    }

    //data
    int x[M_SIZE];
};
