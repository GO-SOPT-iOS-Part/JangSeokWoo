//
//  Node.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/22.
//

import Foundation

final class Node<T> {
    var data: T
    var prev: Node?
    var next: Node?
    
    init(_ data: T, prev: Node? = nil, next: Node? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}
