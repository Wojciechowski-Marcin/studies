//
// Created by marcin on 18.03.18.
//

#include "stdafx.h"
#include "MList.h"
#include <cstdlib>
#include <iostream>


MList::MList() {
	size = 0;
	head = nullptr;
}

MList::~MList() {
	if (head) {
		ElemList *curr = head;
		ElemList *next = curr->next;
		while (curr->next) {
			next = curr->next;
			delete curr;
			curr = next;
		}
		delete next;
	}
}

void MList::print() {
	std::cout << "\n";
	ElemList *tmp = head;
	while (tmp) {
		std::cout << tmp->data << " ";
		tmp = tmp->next;
	}
	std::cout << "\n\n";
}

int MList::getSize() {
	return size;
}

void MList::push_front(int newData) {   //adds element on index 0
	if (!head) {                        //if adding 1st element
		head = new ElemList;
		head->data = newData;
		head->next = nullptr;
		head->prev = nullptr;
		size++;
	}
	else {
		ElemList *tmp = new ElemList;
		tmp->data = newData;
		tmp->next = head;               //newElem->next points to current head
		head->prev = tmp;               //current head->prev points to tmp
		tmp->prev = nullptr;            //tmp is the new head
		head = tmp;
		size++;                         //increase the size
	}
}

void MList::push_back(int newData) {    //adds element on last index
	if (!head) {                        //if adding 1st element
		head = new ElemList;
		head->data = newData;
		head->next = nullptr;
		head->prev = nullptr;
		size++;
	}
	else {
		ElemList *tmp = head;
		ElemList *newElem = new ElemList;
		while (tmp->next) {             //find last element
			tmp = tmp->next;
		}
		newElem->data = newData;
		newElem->prev = tmp;            //newElem->prev points to last element
		newElem->next = nullptr;        //newElem is the last element
		tmp->next = newElem;            //current lastElem->next points to newElem
		size++;                         //increase the size
	}
}

void MList::push_inside(int newData, int index) {
	if (index == 0) {                   //if adding on index 0
		push_front(newData);
	}
	else if (index == size) {         //if adding on last index
		push_back(newData);
	}
	else {
		ElemList *tmp = head;
		ElemList *newElem = new ElemList;
		for (int i = 0; i < index - 1; i++) {   //find element before the place we insert new one
			tmp = tmp->next;
		}
		newElem->data = newData;
		newElem->prev = tmp;            //newElem->prev points to element at index-1
		newElem->next = tmp->next;      //newElem->next points to element at index
		tmp->next->prev = newElem;      //(element at index)->prev point to newElem
		tmp->next = newElem;            //(element at index-1)->next points to newElem
		size++;                         //increase the size
	}
}

void MList::pop_front() {               //removes element at index 0
	if (head->next) {                   //if there is more than 1 element
		head->next->prev = nullptr;
		head = head->next;              //makes element at index 1 the new head
	}
	else {                              //if there is 1 or 0 elements
		head = nullptr;
	}

	if (size != 0) {                      //if there were more than 0 elements
		size--;                         //decrease the size
	}
}

void MList::pop_back() {                //removes element at last index
	if (head) {                         //if there is at least 1 element
		ElemList *tmp = head;
		while (tmp->next) {             //find last element
			tmp = tmp->next;
		}
		if (tmp->prev) {                //if last element isn't root
			tmp->prev->next = nullptr;  //make pre-last element new last element
		}
		else {                          //if last element is root
			head = nullptr;
		}
		size--;                         //decrease the size
	}
}

void MList::pop_inside(int index) {
	if (index == 0) {                   //if removing element at index 0
		pop_front();
	}
	else if (index == size - 1) {         //if removing element at last index
		pop_back();
	}
	else {
		ElemList *tmp = head;
		for (int i = 0; i < index - 1; i++) {
			tmp = tmp->next;            //find element before given index
		}
		tmp->next->next->prev = tmp;
		tmp->next = tmp->next->next;    //skip element at given index in pointers
		size--;                         //decrease the size
	}
}

bool MList::findElement(int n) {        //returns true if element with specific data is found
	ElemList *tmp = head;
	while (tmp) {
		if (tmp->data == n) {
			return true;
		}
		tmp = tmp->next;
	}
	return false;
}