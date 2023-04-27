//
//  Observable.swift
//  SOPTving
//
//  Created by 장석우 on 2023/04/28.
//

import Foundation

final class Observable<T> {
    
    struct Observer<T> {
        weak var observer: AnyObject?
        let block: (T) -> Void
    }
    
    private var observers = [Observer<T>]()
    
    var value: T {
        didSet { notifyObservers() }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func observe(on observer: AnyObject, observerBlock: @escaping (T) -> Void) {
        observers.append(Observer(observer: observer, block: observerBlock))
        observerBlock(self.value)
    }
    
    func remove(observer: AnyObject) {
        observers = observers.filter { $0.observer !== observer }
    }
    
    private func notifyObservers() {
        for observer in observers {
            observer.block(self.value)
        }
    }
}

