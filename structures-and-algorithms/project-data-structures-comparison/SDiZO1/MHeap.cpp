//
// Created by marcin on 18.03.18.
//

#include "stdafx.h"
#include "MHeap.h"
#include <iostream>
#include <queue>
#include <cmath>


MHeap::MHeap() {
	array = nullptr;
	size = 0;
}

MHeap::~MHeap() {
	delete[] array;
}

int MHeap::leftChild(int index) {       //returns index of the left child
	return 2 * index + 1;
}

int MHeap::rightChild(int index) {      //returns index of the right child
	return 2 * index + 2;
}

int MHeap::parent(int index) {          //returns index of the parent
	return (index - 1) / 2;
}

void MHeap::push(int newData) {         //adds new element
	if (size == 0) {
		array = new int[1];
		array[0] = newData;             //if heap has no elements add element as a root
		size++;
	}
	else {
		int* tmp = new int[size + 1];
		for (int i = 0; i < size; i++) {
			tmp[i] = array[i];          //copy elements to bigger array
		}
		tmp[size] = newData;            //add new element on the last position
		delete[] array;                 //free previous memory
		array = tmp;                    //make heap array pointer point to new array
		size++;                         //increase the size
		fixUp();                  //restore heap conditions
	}
}

void MHeap::pop_root() {                //removes element
	if (size > 0) {
		array[0] = array[size - 1];     //switches root and the last element
		int *tmp = new int[size - 1];
		for (int i = 0; i < size - 1; i++) {
			tmp[i] = array[i];          //copy elements to smaller array
		}
		delete[] array;                //free previous memory
		array = tmp;                    //make heap array pointer point to new array
		size--;                         //make size smaller
		fixDown(0);                     //restore heap conditions (starting from root)
	}
}

bool MHeap::findElement(int data) {     //returns true if heap contains element with given data
	return MHeap::findElementRec(0, data);
}

bool MHeap::findElementRec(int index, int data) {
	if (index >= size) return false;
	if (array[index] == data) return true;
	if (array[index] > data) return false;
	if (findElementRec(leftChild(index), data)) return true;
	if (findElementRec(rightChild(index), data)) return true;
}

int MHeap::findElement2(int data) {     //returns index of element with given data or -1 if not found
	if (size > 0) {
		for (int i = 0; i < size; i++) {
			if (array[i] == data) {
				return i;
			}
		}
	}
	return -1;
}

void MHeap::fixUp() {                    //restores heap conditions (starting from last element)
	if (size > 1) {
		int i = size - 1;                 //make i index the last element
		int j = parent(i);              //make j index of parent of element at index i
		while (j > 0) {                 //while in array
			if (array[i] > array[j]) {   //if child bigger than parent
				int tmp = array[i];
				array[i] = array[j];
				array[j] = tmp;         //swap elements
			}
			i = j;
			j = parent(i);              //keep checking specific path
		}
	}
}

void MHeap::fixDown(int index) {         //restores heap conditions (starting at given index)
	if (size > 1) {                       //if there are at least 2 elements
		int i = index;                  //i = index of element we start repairing
		int j = leftChild(i);           //j = index of i's left child
		while (j < size) {                //while j is in array

			if (j + 1 < size && array[j] < array[j + 1]) {   //if i has right child and its bigger than left child
				j = rightChild(i);      //make j right child
			}

			if (array[j] > array[i]) {    //if child is bigger than parent
				int tmp = array[i];
				array[i] = array[j];
				array[j] = tmp;         //swap elements
			}
			i = j;
			j = leftChild(j);           //keep changing specific path
		}
	}
}

void MHeap::pop(int data) {
	int index = MHeap::findElement2(data);  //find element with given data
	if (index != -1) {                       //if element is found
		int * tmp = new int[size - 1];
		for (int i = 0; i < index; i++) {   //copy old array ignoring element to delete
			tmp[i] = array[i];
		}
		for (int i = index; i < size - 1; i++) {
			tmp[i] = array[i + 1];
		}
		delete[] array;                     //free old space
		array = tmp;
		size--;
		create_heap();                      //fix whole heap
	}
}

void MHeap::create_heap() {              //Floyd's algorythm
										 //starting from the last element of the heap that's not a leaf
										 //repair the heap down and go up the heap
										 //finish when you meet root
	for (int i = (size - 2) / 2; i >= 0; --i) {
		fixDown(i);
	}
}

void MHeap::print() {
	std::cout << "\n";
	int height = ceil(log(size) + 1); //+1 handle the last leaves
	int width = pow(2, height) * height;
	int index = 0;
	for (int i = 0; i <= height; i++) { //for each level of the tree
		for (int j = 0; j < pow(2, i); j++) { // for each node on that tree level
			int digitWidth = 1;
			if (array[index] != 0) {
				digitWidth = floor(log10(abs(array[index]))) + 1;
			}


			for (int x = 0; x < width / pow(2, i) - digitWidth; x++) {
				std::cout << " ";
			}

			if (index < size) {
				std::cout << array[index++];
			}
			else {
				std::cout << "-";
			}


			for (int x = 0; x < width / (pow(2, i)); x++) {
				std::cout << " ";
			}

		}
		std::cout << "\n";
	}
}