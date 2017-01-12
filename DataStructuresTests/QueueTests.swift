// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class QueueTests : XCTestCase {

    func testEnqueue() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        XCTAssertEqual(queue.toArray(), ["1","2"], "The item is not enqueued correctly!")
    }

    func testDequeue() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        try XCTAssertEqual(queue.dequeue(), "1", "The item is not dequeued correctly!")
        try XCTAssertEqual(queue.dequeue(), "2", "The item is not dequeued correctly!")
        try XCTAssertThrowsError(queue.dequeue(), "The queue should produce an error!")
    }

    func testPeek() {
        var queue = Queue<String>()
        try XCTAssertThrowsError(queue.dequeue(), "The queue should produce an error!")
        queue.enqueue("1")
        queue.enqueue("2")
        try XCTAssertEqual(queue.peek(), "1", "The item is not peeking correctly!")
        try XCTAssertEqual(queue.peek(), "1", "The item is not peeking correctly!")
    }

    func testCount() {
        var queue = Queue<String>()
        XCTAssertEqual(queue.count, 0, "The queue's length is not correct!");
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        XCTAssertEqual(queue.count, 3, "The queue's length is not correct!");
    }

    func testIsEmpty() {
        var queue = Queue<String>()
        XCTAssertTrue(queue.isEmpty, "The queue should be empty!");
        queue.enqueue("1")
        XCTAssertFalse(queue.isEmpty, "The queue should be empty!");
        try! queue.dequeue()
        XCTAssertTrue(queue.isEmpty, "The queue should be empty!");
    }

    func testRemoveAll() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.removeAll()
        XCTAssertTrue(queue.isEmpty, "The queue should be empty!")
    }

    func testToArray() {
        var queue = Queue<String>()
        XCTAssertEqual(queue.toArray(), [], "The starting array should be empty!")
        queue.enqueue("1")
        queue.enqueue("2")
        XCTAssertEqual(queue.toArray(), ["1","2"], "toArray is not functioning correctly!")
        try! queue.dequeue()
        queue.enqueue("3")
        XCTAssertEqual(queue.toArray(), ["2","3"], "toArray is not functioning correctly!")
    }
}
