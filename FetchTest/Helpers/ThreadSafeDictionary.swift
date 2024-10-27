//
//  ThreadSafeDictionary.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

class ThreadSafeDictionary<Key: Hashable, Value> {
    private var dictionary = [Key: Value]()
    
    let queue = DispatchQueue(label: "ThreadSafeDictionary", qos: .userInitiated, attributes: .concurrent)
    
    subscript(key: Key) -> Value? {
        get {
            var result: Value?
            
            queue.sync {
                result = dictionary[key]
            }
            
            return result
        }
        set {
            queue.async(flags: .barrier) {
                self.dictionary[key] = newValue
            }
        }
    }
}
