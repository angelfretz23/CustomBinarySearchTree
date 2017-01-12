//: Playground - noun: a place where people can play

import UIKit

class Node <T: Comparable>{
    var value: T
    var parent: Node?
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T){
        self.value = value
    }
    
    public convenience init(array: [T]){
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst(){
            insert(value: v, parent: self)
        }
    }
    
    public func insert(value: T){
        insert(value: value, parent: self)
    }
    
    private func insert(value: T, parent: Node){
        if value < self.value{
            if let leftChild = leftChild {
                leftChild.insert(value: value, parent: leftChild)
            } else {
                leftChild = Node(value: value)
                leftChild?.parent = parent
            }
        } else {
            if let rightChild = rightChild {
                rightChild.insert(value: value, parent: rightChild)
            } else {
                rightChild = Node(value: value)
                rightChild?.parent = parent
            }
        }
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let leftChild = leftChild {
            s += "(\(leftChild.description)) <- "
        }
        s += "\(value)"
        if let rightChild = rightChild {
            s += " -> (\(rightChild.description))"
        }
        return s
    }
}

let tree = Node(value: "M")
