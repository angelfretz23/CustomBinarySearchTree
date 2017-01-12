#Binary Search Tree
Objective: Create a Custom Binary Search Tree that is self maintaining when adding new terms to the tree from the dictionary.json file located in the Playground's Resources folder. Also, to be able to search through all the terms quickly and efficiently.

##Creating the Node Class using Generics
A Binary Search Tree can be of anytype. So we arent limited by the implicitly specifying the type, I will use a Generic with  `Comparable` specified in order to be able to use binary operators  with the object.
```
class Node <T: Comparable>{
	var value: T
	var parent: Node?
	var leftChild: Node?
	var rightChild: Node?
	
	init(value: T){
		self.value = value
	}
}
```