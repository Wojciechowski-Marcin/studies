//
// Created by marcin on 18.03.18.
//

#pragma once

class MList
{
private:
	struct ElemList {
		int data;
		ElemList *prev;
		ElemList *next;
	};
	ElemList *head;
	int size;

public:
	MList();
	~MList();
	void push_front(int newData);
	void push_back(int newData);
	void push_inside(int newData, int index);
	void pop_front();
	void pop_back();
	void pop_inside(int index);
	bool findElement(int n);

	int getSize();
	void print();
};