//
// Created by marcin on 18.03.18.
//

#pragma once

class MHeap
{
private:
	int* array;
	int size;
	int leftChild(int index);
	int rightChild(int index);
	int parent(int index);
	void fixUp();
	void fixDown(int index);
	int findElement2(int data);
	bool findElementRec(int index, int data);
	void create_heap();
	void pop_root();
public:
	MHeap();
	~MHeap();
	void push(int newData);
	void pop(int data);
	bool findElement(int data);
	void print();
};
