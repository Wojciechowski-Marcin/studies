//
// Created by marcin on 18.03.18.
//

#pragma once

class MArray
{
private:
	int size;
	int *array;
public:
	MArray();
	~MArray();
	void push_front(int newData);
	void push_back(int newData);
	void push_inside(int newData, int index);
	void pop_front();
	void pop_back();
	void pop_inside(int index);
	bool findElement(int n);

	int& operator[](int index);
	int getSize();
	void print();
};