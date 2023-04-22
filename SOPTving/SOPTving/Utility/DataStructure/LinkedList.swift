//
//  LinkedList.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/22.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
           return head == nil
       }
    
    func append(data: T?) {
        let newNode = Node(data)
        
        if isEmpty {
            head = newNode
            tail = newNode
            tail?.next = head
        } else {
            tail?.next = newNode
            tail = newNode
            tail?.next = head
        }
    }
    
    // append 인자에 배열을 넣었을 경우, append(T)를 반복한다.
    func append(data: [T]?) {
        guard let data else { return }
        for t in data {
            append(data: t)
        }
    }
    
    func getFirstNode() -> Node<T>? {
        return head
    }
    

    
}
