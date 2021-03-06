// SDiZO1.cpp : Defines the entry point for the console application.
//
#pragma comment(linker, "/STACK: 20000000")
#include "stdafx.h"
#include "MList.h"
#include "MArray.h"
#include "MHeap.h"
#include "RBTree.h"
#include <cstdlib>
#include <iostream>
#include <ctime>
#include <limits>
#include <fstream>

using namespace std;

const int ELEM_NUMBER = 20000;
const int TEST_COUNT = 10;
const int PRECISION = 7;
const string FILE_PATH = "Data.txt";

MArray mArray;
MHeap mHeap;
MList mList;
RBTree rbTree;
vector<int> file;

void test_list();
void test_array();
void test_heap();
void test_rbtree();

vector<int> read_file(string filename);

void initialize();
int main_menu();
void structure_menu(int c1);
void handle_operations(int c1, int c2);


int main()
{

	initialize();

	test_list();	cout << "\n";
	test_array();	cout << "\n";
	test_heap();	cout << "\n";
	test_rbtree();	cout << "\n";

	cout << "\n\n\n";

	int tmp = 0;
	while (tmp != 5) {
		tmp = main_menu();
	}

	return 0;
}

void initialize() {

	srand(time(NULL));                          //set rand

	cout.precision(PRECISION);           //set number precision
	cout << fixed;

	mArray = MArray();
	mList = MList();
	mHeap = MHeap();
	rbTree = RBTree();

	file = read_file(FILE_PATH);
}

int main_menu() {
	int c1 = -1;
	while (c1 < 1 || c1 > 5) {
		cout << "Wybierz strukture do sprawdzenia: \n";
		cout << "1. Tablica\n";
		cout << "2. Lista\n";
		cout << "3. Kopiec binarny\n";
		cout << "4. Drzewo czerwono-czarne\n";
		cout << "5. Wyjdz\n";
		cin >> c1;
	}
	if (c1 == 5)
		return 5;

	structure_menu(c1);
}

void structure_menu(int c1) {
	int c2 = -1;
	while (true) {
		cout << "Wybierz operacje na strukturze: \n";
		cout << "1. Zbuduj z pliku\n";
		cout << "2. Usun\n";
		cout << "3. Dodaj\n";
		cout << "4. Znajdz\n";
		cout << "5. Wyswietl\n";
		cout << "6. Cofnij\n";
		cin >> c2;

		if (c2 > 0 && c2 < 6)
			handle_operations(c1, c2);
		if (c2 == 6)
			return;
	}


}

void handle_operations(int c1, int c2) {
	int c3, c4;

	// array
	if (c1 == 1) {
		switch (c2) {
		case 1:
			mArray = MArray();
			for (int i : file) {
				mArray.push_back(i);
			}
			break;
		case 2:
			cout << "Element z której pozycji chcesz usunac?\n";
			cin >> c3;
			if (c3 > mArray.getSize() - 1) {
				cout << "Przekroczenie zakresu!";
				break;
			}
			mArray.pop_inside(c3);
			break;
		case 3:
			cout << "Na ktorej pozycji chcesz dodac element?\n";
			cin >> c3;
			if (c3 > mArray.getSize()) {
				cout << "Przekroczenie zakresu!";
				break;
			}
			cout << "Podaj wartosc:\n";
			cin >> c4;
			mArray.push_inside(c4, c3);
			break;
		case 4:
			cout << "Podaj wartosc elementu ktory chcesz znalezc:\n";
			cin >> c3;
			cout << "Czy podany element istnieje?: ";
			if (mArray.findElement(c3))   cout << "tak\n";
			else cout << "nie\n";
			break;
		default:
			break;
		}
		mArray.print();
	}

	// list
	else if (c1 == 2) {
		switch (c2) {
		case 1:
			mList = MList();
			for (int i : file) {
				mList.push_back(i);
			}
			break;
		case 2:
			cout << "Element z której pozycji chcesz usunac?\n";
			cin >> c3;
			if (c3 > mList.getSize() - 1) {
				cout << "Przekroczenie zakresu!";
				break;
			}
			mList.pop_inside(c3);
			break;
		case 3:
			cout << "Na ktorej pozycji chcesz dodac element?\n";
			cin >> c3;
			if (c3 > mList.getSize()) {
				cout << "Przekroczenie zakresu!";
				break;
			}
			cout << "Podaj wartosc:\n";
			cin >> c4;
			mList.push_inside(c4, c3);
			break;
		case 4:
			cout << "Podaj wartosc elementu ktory chcesz znalezc:\n";
			cin >> c3;
			cout << "Czy podany element istnieje?: ";
			if (mList.findElement(c3))   cout << "tak\n";
			else cout << "nie\n";
			break;
		default:
			break;
		}
		mList.print();
	}

	// heap
	else if (c1 == 3) {
		switch (c2) {
		case 1:
			mHeap = MHeap();
			for (int i = 0; i < file.size(); i++) {
				mHeap.push(file[i]);
			}
			break;
		case 2:
			cout << "Ktora wartosc chcesz usunac?\n";
			cin >> c3;
			mHeap.pop(c3);
			break;
		case 3:
			cout << "Podaj wartosc:\n";
			cin >> c3;
			mHeap.push(c3);
			break;
		case 4:
			cout << "Podaj wartosc elementu ktory chcesz znalezc:\n";
			cin >> c3;
			cout << "Czy podany element istnieje?: ";
			if (mHeap.findElement(c3))   cout << "tak\n";
			else cout << "nie\n";

			break;
		default:
			break;
		}
		mHeap.print();
	}

	// tree
	else if (c1 == 4) {
		switch (c2) {
		case 1:
			rbTree = RBTree();
			for (int i = 0; i < file.size(); i++) {
				rbTree.push(file[i]);
			}
			break;
		case 2:
			cout << "Ktora wartosc chcesz usunac?\n";
			cin >> c3;
			rbTree.pop(c3);
			break;
		case 3:
			cout << "Podaj wartosc:\n";
			cin >> c3;
			rbTree.push(c3);
			break;
		case 4:
			cout << "Podaj wartosc elementu ktory chcesz znalezc:\n";
			cin >> c3;
			cout << "Czy podany element istnieje?: ";
			if (rbTree.findElement(c3))   cout << "tak\n";
			else cout << "nie\n";
			break;
		default:
			break;
		}
		rbTree.print();
	}
}

void test_list() {

	double time_push_front[TEST_COUNT][ELEM_NUMBER];
	double time_push_back[TEST_COUNT][ELEM_NUMBER];
	double time_push_inside[TEST_COUNT][ELEM_NUMBER];
	double time_pop_front[TEST_COUNT][ELEM_NUMBER];
	double time_pop_back[TEST_COUNT][ELEM_NUMBER];
	double time_pop_inside[TEST_COUNT][ELEM_NUMBER];
	double time_find_element[TEST_COUNT][ELEM_NUMBER];

	double push_front_result = 0;
	double push_back_result = 0;
	double push_inside_result = 0;
	double pop_front_result = 0;
	double pop_back_result = 0;
	double pop_inside_result = 0;
	double find_element_result = 0;

	cout << "Testing list: \n";

	for (int j = 0; j < TEST_COUNT; j++) {

		clock_t begin;
		clock_t end;

		//PUSH_FRONT
		MList mlist1 = MList();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist1.push_front(rand() % 100);
			end = clock();
			time_push_front[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}


		//PUSH_BACK
		MList mlist2 = MList();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist2.push_back(rand() % 100);
			end = clock();
			time_push_back[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//PUSH_RANDOM
		MList mlist3 = MList();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist3.push_inside(rand() % 100, rand() % (mlist3.getSize() + 1));
			end = clock();
			time_push_inside[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//FIND_ELEMENT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist1.findElement(rand() % 100);
			end = clock();
			time_find_element[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_FRONT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist1.pop_front();
			end = clock();
			time_pop_front[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_BACK
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist2.pop_back();
			end = clock();
			time_pop_back[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_RANDOM
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mlist3.pop_inside(rand() % mlist3.getSize());
			end = clock();
			time_pop_inside[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

	}

	for (int j = 0; j < TEST_COUNT; j++) {
		for (int i = 0; i < ELEM_NUMBER; i++) {
			push_front_result += time_push_front[j][i];
			push_back_result += time_push_back[j][i];
			push_inside_result += time_push_inside[j][i];
			pop_front_result += time_pop_front[j][i];
			pop_back_result += time_pop_back[j][i];
			pop_inside_result += time_pop_inside[j][i];
			find_element_result += time_find_element[j][i];
		}
	}

	push_front_result /= (TEST_COUNT * ELEM_NUMBER);
	push_back_result /= (TEST_COUNT * ELEM_NUMBER);
	push_inside_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_front_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_back_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_inside_result /= (TEST_COUNT * ELEM_NUMBER);
	find_element_result /= (TEST_COUNT * ELEM_NUMBER);

	cout << "push_front time: " << push_front_result << "\n";
	cout << "push_back time: " << push_back_result << "\n";
	cout << "push_inside time: " << push_inside_result << "\n";
	cout << "pop_front time: " << pop_front_result << "\n";
	cout << "pop_back time: " << pop_back_result << "\n";
	cout << "pop_inside time: " << pop_inside_result << "\n";
	cout << "find_element time: " << find_element_result << "\n";
}
void test_array() {

	double time_push_front[TEST_COUNT][ELEM_NUMBER];
	double time_push_back[TEST_COUNT][ELEM_NUMBER];
	double time_push_inside[TEST_COUNT][ELEM_NUMBER];
	double time_pop_front[TEST_COUNT][ELEM_NUMBER];
	double time_pop_back[TEST_COUNT][ELEM_NUMBER];
	double time_pop_inside[TEST_COUNT][ELEM_NUMBER];
	double time_find_element[TEST_COUNT][ELEM_NUMBER];

	double push_front_result = 0;
	double push_back_result = 0;
	double push_inside_result = 0;
	double pop_front_result = 0;
	double pop_back_result = 0;
	double pop_inside_result = 0;
	double find_element_result = 0;

	cout << "Testing array: \n";

	for (int j = 0; j < TEST_COUNT; j++) {

		clock_t begin;
		clock_t end;

		//PUSH_FRONT
		MArray marray1 = MArray();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray1.push_front(rand() % 100);
			end = clock();
			time_push_front[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//PUSH_BACK
		MArray marray2 = MArray();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray2.push_back(rand() % 100);
			end = clock();
			time_push_back[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//PUSH_INSIDE
		MArray marray3 = MArray();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray3.push_inside(rand() % 100, rand() % (marray3.getSize() + 1));
			end = clock();
			time_push_inside[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//FIND_ELEMENT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray1.findElement(rand() % 100);
			end = clock();
			time_find_element[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_FRONT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray1.pop_front();
			end = clock();
			time_pop_front[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_BACK
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray2.pop_back();
			end = clock();
			time_pop_back[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP_INSIDE
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			marray3.pop_inside(rand() % marray3.getSize());
			end = clock();
			time_pop_inside[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

	}

	for (int j = 0; j < TEST_COUNT; j++) {
		for (int i = 0; i < ELEM_NUMBER; i++) {
			push_front_result += time_push_front[j][i];
			push_back_result += time_push_back[j][i];
			push_inside_result += time_push_inside[j][i];
			pop_front_result += time_pop_front[j][i];
			pop_back_result += time_pop_back[j][i];
			pop_inside_result += time_pop_inside[j][i];
			find_element_result += time_find_element[j][i];
		}
	}

	push_front_result /= (TEST_COUNT * ELEM_NUMBER);
	push_back_result /= (TEST_COUNT * ELEM_NUMBER);
	push_inside_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_front_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_back_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_inside_result /= (TEST_COUNT * ELEM_NUMBER);
	find_element_result /= (TEST_COUNT * ELEM_NUMBER);

	cout << "push_front time: " << push_front_result << "\n";
	cout << "push_back time: " << push_back_result << "\n";
	cout << "push_inside time: " << push_inside_result << "\n";
	cout << "pop_front time: " << pop_front_result << "\n";
	cout << "pop_back time: " << pop_back_result << "\n";
	cout << "pop_inside time: " << pop_inside_result << "\n";
	cout << "find_element time: " << find_element_result << "\n";
}
void test_heap() {

	double time_push[TEST_COUNT][ELEM_NUMBER];
	double time_pop[TEST_COUNT][ELEM_NUMBER];
	double time_find_element[TEST_COUNT][ELEM_NUMBER];

	double push_result = 0;
	double pop_result = 0;
	double find_element_result = 0;

	cout << "Testing heap: \n";

	for (int j = 0; j < TEST_COUNT; j++) {
		clock_t begin;
		clock_t end;

		//PUSH
		MHeap mheap1 = MHeap();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mheap1.push(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_push[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//FIND_ELEMENT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mheap1.findElement(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_find_element[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mheap1.pop(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_pop[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

	}

	for (int j = 0; j < TEST_COUNT; j++) {
		for (int i = 0; i < ELEM_NUMBER; i++) {
			push_result += time_push[j][i];
			pop_result += time_pop[j][i];
			find_element_result += time_find_element[j][i];
		}
	}
	push_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_result /= (TEST_COUNT * ELEM_NUMBER);
	find_element_result /= (TEST_COUNT * ELEM_NUMBER);

	cout << "push time: " << push_result << "\n";
	cout << "pop time: " << pop_result << "\n";
	cout << "find_element time: " << find_element_result << "\n";
}
void test_rbtree() {

	double time_push[TEST_COUNT][ELEM_NUMBER];
	double time_pop[TEST_COUNT][ELEM_NUMBER];
	double time_find_element[TEST_COUNT][ELEM_NUMBER];

	double push_result = 0;
	double pop_result = 0;
	double find_element_result = 0;

	cout << "Testing red-black tree: \n";

	for (int j = 0; j < TEST_COUNT; j++) {

		clock_t begin;
		clock_t end;

		//PUSH
		RBTree mrbtree1 = RBTree();
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mrbtree1.push(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_push[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//FIND_ELEMENT
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mrbtree1.findElement(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_find_element[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

		//POP
		for (int i = 0; i < ELEM_NUMBER; i++) {
			begin = clock();
			mrbtree1.pop(rand() % (ELEM_NUMBER / 2));
			end = clock();
			time_pop[j][i] = double(end - begin) / CLOCKS_PER_SEC;
		}

	}

	for (int j = 0; j < TEST_COUNT; j++) {
		for (int i = 0; i < ELEM_NUMBER; i++) {
			push_result += time_push[j][i];
			pop_result += time_pop[j][i];
			find_element_result += time_find_element[j][i];
		}
	}
	push_result /= (TEST_COUNT * ELEM_NUMBER);
	pop_result /= (TEST_COUNT * ELEM_NUMBER);
	find_element_result /= (TEST_COUNT * ELEM_NUMBER);

	cout << "push time: " << push_result << "\n";
	cout << "pop time: " << pop_result << "\n";
	cout << "find_element time: " << find_element_result << "\n";
}

vector<int> read_file(string filename) {
	ifstream file;
	file.open(filename);

	vector<int> vec;
	int size;

	if (file.is_open()) {
		string size_str;
		getline(file, size_str);
		size = stoi(size_str);
		for (int i = 0; i < size; i++) {
			string tmp;
			getline(file, tmp);
			vec.push_back(stoi(tmp));
		}
	}
	return vec;
}