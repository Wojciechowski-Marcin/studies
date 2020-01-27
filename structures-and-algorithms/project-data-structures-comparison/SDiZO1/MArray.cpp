//
// Created by marcin on 18.03.18.
//

#include "stdafx.h"
#include "MArray.h"
#include <iostream>
#include <cstring>

MArray::MArray() {
	size = 0;
	array = nullptr;
}

void MArray::print() {
	std::cout << "\n";
	for (int i = 0; i < size; i++) {
		std::cout << array[i] << " ";
	}
	std::cout << "\n\n";
}

int MArray::getSize() {
	return size;
}

void MArray::push_front(int newData) {          //adds element at index 0
	if (size > 0) {                         //if array contains at least 1 element
		int *tmp = new int[size + 1];       //make temp array with bigger size
		for (int i = 0; i < size; i++) {
			tmp[i + 1] = array[i];          //copy old array temp leaving index 0 empty
		}
		delete[] array;                     //free old memory
		array = tmp;                        //switch array's pointer
		array[0] = newData;                 //place new data at index 0
		size++;                             //increase size
	}
	else {                                //if array has no elements
		array = new int;
		array[0] = newData;
		size++;
	}
}

void MArray::push_back(int newData) {       //adds element at last index (works the same as push_front)
	if (size > 0) {
		int *tmp = new int[size + 1];
		for (int i = 0; i < size; i++) {
			tmp[i] = array[i];
		}
		delete[] array;
		array = tmp;
		array[size] = newData;
		size++;
	}
	else {
		array = new int[1];
		array[0] = newData;
		size++;
	}
}

void MArray::push_inside(int newData, int index) {  //adds element at given index
	if (size > 0) {                                 //if contains at least 1 element
		int *tmp = new int[size + 1];               //make temp array with bigger size
		for (int i = 0; i < index; i++) {
			tmp[i] = array[i];                      //copy old array to temp from 0 to elem before index
		}
		tmp[index] = newData;                       //insert newData at given index
		for (int i = index; i < size; i++) {
			tmp[i + 1] = array[i];                  //keep copying from index
		}
		delete[] array;
		array = tmp;
		size++;
	}
	else {                                          //if has no elements
		array = new int[1];
		array[0] = newData;
		size++;
	}
}

void MArray::pop_front() {                      //removes element from index 0
	if (size > 0) {
		int* tmp = new int[size - 1];           //create temp array with smaller size
		for (int i = 0; i < size - 1; i++) {
			tmp[i] = array[i + 1];              //copy old array to temp ignoring element at index 0
		}
		delete[] array;                         //free old space
		array = tmp;                            //switch array's pointer
		size--;                                 //decrease size
	}
}

void MArray::pop_back() {                       //removes element from last index (works same as pop_front)
	if (size > 0) {
		int* tmp = new int[size - 1];
		for (int i = 0; i < size - 1; i++) {
			tmp[i] = array[i];
		}
		delete[] array;
		array = tmp;
		size--;
	}
}

void MArray::pop_inside(int index) {            //removes element at given index
	if (size > 0) {                             //if contains at least 1 element
		if (index == 0) {
			pop_front();
		}
		else if (index == size - 1) {
			pop_back();
		}
		else {
			int* tmp = new int[size - 1];           //create temp array with smaller size
			for (int i = 0; i < index; i++) {
				tmp[i] = array[i];                  //copy old array to temp from 0 to elem before index
			}
			for (int i = index; i < size - 1; i++) {
				tmp[i] = array[i + 1];              //keep copying ignoring item at index
			}
			delete[] array;                         //free old memory
			array = tmp;                            //switch array's pointer
			size--;                                 //decrease size
		}
	}
}

bool MArray::findElement(int value) {       //returns true if element with given data is in array
	for (int i = 0; i < size; i++) {
		if (array[i] == value) {
			return true;
		}
	}
	return false;
}

int& MArray::operator[](int index) {
	return array[index];
}

MArray::~MArray() {
	delete[] array;
}