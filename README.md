#Binary Search Tree
Objective: Create a Custom Binary Search Tree that is self maintaining when adding new terms to the tree from the dictionary.json file located in the Playground's Resources folder. Also, to be able to search through all the terms quickly and efficiently.

### Creating the Node Class using Generics
A Binary Search Tree can be of anytype. So we arent limited by the implicitly specifying the type, I will use a Generic with  `Comparable` specified in order to be able to use binary operators  with the object.
```
class Node <T: Comparable>{
	var value: T
	var parent: Node?
	var leftLeaf: Node?
	var rightLeaf: Node?
	
	init(value: T){
		self.value = value
	}
}
```

### Arraying nodes after insert
Testing by creating a tree with an array of 5 numbers: 1, 2, 3, 4, 5. But the array will be shuffled to get scenerios when the tree is unbalanced. An unbalanced tree is when the absolute value of the height of the right side to the root minus the hight of left side is no greater than 1.

Convenience initializer for the array
```
convenience init(array: [T]){
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst(){
            insert(value: v, parent: self)
        }
    }
```

Insert Function
```
func insert(value: T, parent: Node){
    if value < self.value{
        if let leftChild = leftLeaf {
            leftChild.insert(value: value, parent: leftChild)
        } else {
            leftLeaf = Node(value: value)
            leftLeaf?.parent = parent
        }
    } else {
        if let rightChild = rightLeaf {
            rightChild.insert(value: value, parent: rightChild)
        } else {
            rightLeaf = Node(value: value)
            rightLeaf?.parent = parent
        }
    }
}
```