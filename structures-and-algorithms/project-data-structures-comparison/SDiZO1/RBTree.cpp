
//
// Created by marcin on 18.03.18.
//

#include "stdafx.h"
#include "RBTree.h"
#include <iostream>
#include <queue>
#include <cmath>
#include <iomanip>

RBTree::RBTree() {
	S = new Node;                       // declare sentinel
	S->parent = nullptr;
	S->left = nullptr;
	S->right = nullptr;
	S->data = 0;
	S->color = BLACK;
	root = S;                           // make root sentinel
	size = 0;
}

RBTree::~RBTree() {
	removeElement(root);
}

void RBTree::removeElement(RBTree::Node *node) {    // frees memory
	if (node != S) {
		removeElement(node->left);
		removeElement(node->right);
		delete node;
	}
}

void RBTree::push(int data) {            //adds element
	Node *newElem = new Node;
	newElem->left = S;
	newElem->right = S;
	newElem->parent = root;
	newElem->data = data;
	Node *tmp;

	if (newElem->parent == S) {
		root = newElem;
	}
	else {
		while (true) {
			if (data > newElem->parent->data) {              // if data is greater than newElems parent data
				if (newElem->parent->right == S) {
					newElem->parent->right = newElem;
					break;
				}
				newElem->parent = newElem->parent->right;
			}
			else if (data < newElem->parent->data) {       // if data is smaller than newElems parent data
				if (newElem->parent->left == S) {
					newElem->parent->left = newElem;
					break;
				}
				newElem->parent = newElem->parent->left;
			}
			else {                                        // if adding element is not possible (equal data)
				delete newElem;
				return;
			}
		}

		// fix red-black tree conditions
		newElem->color = RED;
		while (newElem != root && newElem->parent->color == RED) {
			if (newElem->parent == grandparent(newElem)->left) {
				tmp = uncle(newElem);

				// case 1 (uncle is red)
				if (tmp->color == RED) {
					newElem->parent->color = BLACK;
					tmp->color = BLACK;
					grandparent(newElem)->color = RED;
					newElem = grandparent(newElem);
					continue;
				}

				// case 2 (newElem is right child)
				if (newElem == parent(newElem)->right) {
					newElem = parent(newElem);
					rotateLeft(newElem);
				}

				// case 3
				parent(newElem)->color = BLACK;
				grandparent(newElem)->color = RED;
				rotateRight(grandparent(newElem));
				break;
			}
			else {            // mirror cases
				tmp = uncle(newElem);

				// mirror case 1
				if (tmp->color == RED) {
					parent(newElem)->color = BLACK;
					tmp->color = BLACK;
					grandparent(newElem)->color = RED;
					newElem = grandparent(newElem);
					continue;
				}

				// mirror case 2
				if (newElem == parent(newElem)->left) {
					newElem = parent(newElem);
					rotateRight(newElem);
				}

				// mirror case 3
				parent(newElem)->color = BLACK;
				grandparent(newElem)->color = RED;
				rotateLeft(grandparent(newElem));
				break;
			}
		}
	}
	root->color = BLACK;
	size++;
}

void RBTree::pop(int data) {                            //deletes element with specific data
	Node * deleteNode = RBTree::findElementNode(data);  //find element with given data
	if (deleteNode != S) {                                //if element is found
		Node* A;
		Node* B;
		Node* C;
		if (deleteNode->left == S || deleteNode->right == S) {    //if it has at least 1 children
			A = deleteNode;
		}
		else {
			A = RBTree::findSuccessor(deleteNode);
		}

		// fixing parent pointers
		if (A->left != S) {                          //if successor has left child
			B = A->left;
		}
		else {
			B = A->right;
		}

		B->parent = A->parent;

		// fixing child pointers
		if (A->parent == S) {                        //if successor is root
			root = B;
		}
		else if (A == A->parent->left) {              //if successor is left child
			A->parent->left = B;                //skip successor in parent->left pointer
		}
		else {                                //if successor is right child
			A->parent->right = B;               //skip successor in parent->right pointer
		}


		// swap data if necessary
		if (A != deleteNode) {
			deleteNode->data = A->data;
		}

		// fix tree structure
		if (A->color == BLACK) {
			while (B != root && B->color == BLACK) {
				if (B == parent(B)->left) {
					C = sibling(B);

					// case 1
					if (C->color == RED) {
						C->color = BLACK;
						parent(B)->color = RED;
						rotateLeft(parent(B));
						C = sibling(B);
					}

					// case 2
					if (C->left->color == BLACK && C->right->color == BLACK) {
						C->color = RED;
						B = parent(B);
						continue;
					}

					// case 3
					if (C->right->color == BLACK) {
						C->left->color = BLACK;
						C->color = RED;
						rotateRight(C);
						C = sibling(B);
					}

					// case 4
					C->color = parent(B)->color;
					parent(B)->color = BLACK;
					C->right->color = BLACK;
					rotateLeft(parent(B));

					B = root;


				}
				else {
					// mirror situations
					C = sibling(B);

					// mirror case 1
					if (C->color == RED) {
						C->color = BLACK;
						parent(B)->color = RED;
						rotateRight(parent(B));
						C = sibling(B);
					}

					// mirror case 2
					if ((C->left->color == BLACK) && (C->right->color == BLACK)) {
						C->color = RED;
						B = parent(B);
						continue;
					}

					// mirror case 3
					if (C->left->color == BLACK) {
						C->right->color = BLACK;
						C->color = RED;
						rotateLeft(C);
						C = sibling(B);
					}

					// mirror case 4
					C->color = parent(B)->color;
					parent(B)->color = BLACK;
					C->left->color = BLACK;
					rotateRight(parent(B));

					B = root;
				}
			}
		}
		B->color = BLACK;
		delete A;


		//TODO POP TREE
	}

}

bool RBTree::findElement(int data) {        //returns true if found element with specific data
	Node * node = root;
	while (node != S && node->data != data) { //loop until data is found or end of the tree
		if (data > node->data) {             //if data is greater than current node->data go right else go left
			node = node->right;
		}
		else {
			node = node->left;
		}
	}
	return node != S;                        //if node not found return false
}

void RBTree::print() {
	int height = ceil(log(size) + 1);       // +1 handle the last leaves
	int width = pow(2, height) * height;


	// copy tree into vector
	int elemNr = 0;
	for (int i = 0; i < height; i++)
		elemNr += pow(2, i);
	std::vector<Node*> vec;
	Node* tmp = root;
	vec.push_back(tmp);
	for (int i = 1; i <= elemNr; i++) {
		if (tmp != S && tmp != nullptr) {
			vec.push_back(tmp->left);
			vec.push_back(tmp->right);
		}
		else {
			vec.push_back(nullptr);
			vec.push_back(nullptr);
		}
		tmp = vec[i];
	}

	// display (similar to heap print func)
	int index = 0;
	for (int i = 0; i <= height; i++) {                     // for each level of the tree
		for (int j = 0; j < pow(2, i); j++) {               // for each node on that tree level
			int digitWidth = 1;
			if (vec[index] != nullptr && vec[index] != S && vec[index]->data != 0) {
				digitWidth = floor(log10(abs(vec[index]->data))) + 1;
				if (vec[index]->color == RED) {
					digitWidth++;
				}
			}

			for (int x = 0; x < width / pow(2, i) - digitWidth; x++) {
				std::cout << " ";
			}

			if (vec[index] != S && vec[index] != nullptr) {
				std::cout << vec[index]->data;
				if (vec[index]->color == RED) {
					std::cout << "R";
				}
			}
			else {
				if (vec[index] == S)
					std::cout << "S";
				else
					std::cout << "-";
			}
			index++;


			for (int x = 0; x < width / (pow(2, i)); x++) {
				std::cout << " ";
			}

		}
		std::cout << "\n";
	}
}

void RBTree::rotateLeft(Node *node) {
	Node * tmp = node->right;

	node->right = tmp->left;
	if (node->right != S) {
		node->right->parent = node;
	}

	tmp->parent = node->parent;

	if (node->parent == S) {
		root = tmp;
	}
	else if (node == node->parent->left) {
		node->parent->left = tmp;
	}
	else {
		node->parent->right = tmp;
	}

	tmp->left = node;
	node->parent = tmp;
}

void RBTree::rotateRight(Node *node) {
	Node * tmp = node->left;

	node->left = tmp->right;
	if (node->left != S) {
		node->left->parent = node;
	}

	tmp->parent = node->parent;

	if (node->parent == S) {
		root = tmp;
	}
	else if (node == node->parent->left) {
		node->parent->left = tmp;
	}
	else {
		node->parent->right = tmp;
	}

	tmp->right = node;
	node->parent = tmp;
}


RBTree::Node * RBTree::findSuccessor(Node* node) {  //returns pointer to node's successor or nullptr if not found
	if (node->right != S) {                               //if node has right child
		return RBTree::findMinimum(node->right);        //successor is min value from node->right subtree
	}
	Node * parent = node->parent;
	while (parent != S && parent->left != node) {   //loop until node is left child
		node = parent;
		parent = parent->parent;
	}
	return parent;
}

RBTree::Node * RBTree::findMinimum(Node* node) {    //returns pointer to node with min value (starting from node)
	while (node->left != S) {
		node = node->left;
	}
	return node;
}

RBTree::Node * RBTree::findElementNode(int data) { //returns pointer to element with specific data
	Node * node = root;
	while (node != S && node->data != data) {
		if (data > node->data) {
			node = node->right;
		}
		else {
			node = node->left;
		}
	}
	return node;
}


RBTree::Node * RBTree::parent(Node* node) {
	return node->parent;
}
RBTree::Node * RBTree::grandparent(Node* node) {
	Node *p = parent(node);
	if (p == S) {
		return S;
	}
	return parent(p);
}
RBTree::Node * RBTree::sibling(Node* node) {
	Node * p = parent(node);
	if (p == S) {
		return S;
	}
	if (node == p->left) {
		return p->right;
	}
	else {
		return p->left;
	}
}
RBTree::Node * RBTree::uncle(Node* node) {
	Node * p = parent(node);
	Node * g = grandparent(node);
	if (g == S) {
		return S;
	}
	return sibling(p);
}