#include<stdio.h> 
#include<stdlib.h> 
#include <klee/klee.h>
#define MAX 5
struct node 
{ 
	int key; 
	struct node *left, *right; 
};  
struct node *newNode(int item) 
{ 
	struct node *temp = (struct node *)malloc(sizeof(struct node)); 
	temp->key = item; 
	temp->left = temp->right = NULL; 
	return temp; 
} 
struct node* insert(struct node* node, int key) 
{ 
	if (node == NULL) return newNode(key); 
	if (key < node->key) 
		node->left = insert(node->left, key); 
	else if (key > node->key) 
		node->right = insert(node->right, key); 
	return node; 
} 
int main() 
{ 
	struct node *root = NULL; 
	int array[MAX];
	klee_make_symbolic(&array,sizeof(array),"array");
	root = insert(root, array[0]);
	for(int i=1;i<MAX;i++){
		insert(root, array[i]); 
			
	} 
	return 0; 
} 

