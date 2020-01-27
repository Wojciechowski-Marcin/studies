//
// Created by marcin on 18.03.18.
//

#pragma once
#include <string>
#include <vector>

class RBTree {
private:
	enum Color {
		BLACK,
		RED
	};
	struct Node {
		Node * parent;
		Node * left;
		Node * right;
		int data;
		Color color;
	};
	Node * S;
	Node * root;
	int size;

	Node * findSuccessor(Node * node);
	Node * findMinimum(Node * node);

	Node * findElementNode(int data);

	void rotateLeft(Node *node);
	void rotateRight(Node *node);

	Node* uncle(Node*node);
	Node* sibling(Node*node);
	Node* parent(Node*node);
	Node* grandparent(Node*node);

	void removeElement(Node* node);

public:
	RBTree();
	~RBTree();
	void push(int data);
	void pop(int data);
	bool findElement(int data);
	void print();

};