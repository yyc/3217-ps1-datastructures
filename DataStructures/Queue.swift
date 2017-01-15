// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 An enum of errors that can be thrown from the `Queue` struct.
 */
enum QueueError: Error {
    /// Thrown when trying to access an element from an empty queue.
    case emptyQueue
}


/**
 A generic `Queue` class whose elements are first-in, first-out.

 - Authors: CS3217, Yuan Yuchuan
 - Date: 2017
 */
struct Queue<T> {
    
    private var queueArray = Array<T>()
    private var head:Int = 0
    private var tail:Int = 0
    /// Adds an element to the tail of the queue.
    /// - Parameter item: The element to be added to the queue
    mutating func enqueue(_ item: T) {
        queueArray.append(item)
        tail = tail + 1
    }

    /// Removes an element from the head of the queue and return it.
    /// - Returns: item at the head of the queue
    /// - Throws: QueueError.EmptyQueue
    mutating func dequeue() throws -> T {
        if(head == tail){
            throw QueueError.emptyQueue
        }
        
        let value = queueArray[head]
        head = head + 1
        return value
    }

    /// Returns, but does not remove, the element at the head of the queue.
    /// - Returns: item at the head of the queue
    /// - Throws: QueueError.EmptyQueue
    func peek() throws -> T {
        if(head == tail){
            throw QueueError.emptyQueue
        }
        return queueArray[head]
    }

    /// The number of elements currently in the queue.
    var count: Int {
        return tail - head
    }

    /// Whether the queue is empty.
    var isEmpty: Bool {
        return tail == head
    }

    /// Removes all elements in the queue.
    mutating func removeAll() {
        head = 0
        tail = 0
    }

    /// Returns an array of the elements in their respective dequeue order, i.e.
    /// first element in the array is the first element to be dequeued.
    /// - Returns: array of elements in their respective dequeue order
    func toArray() -> [T] {
        if(self.isEmpty){
            return Array<T>()
        }
        
        return Array(queueArray[Range(head..<tail)])
    }
}
