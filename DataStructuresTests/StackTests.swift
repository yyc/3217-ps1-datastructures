// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class StackTests : XCTestCase {

    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1], "The item is not pushed correctly!")
    }

    func testPop() {
        var stack = Stack<Int>()
        stack.push(1)
        
        try XCTAssertEqual(stack.pop(), 1, "The item was not popped correctly!")
        try XCTAssertThrowsError(stack.pop(), "The stack should throw an error!")
    }

    func testPeek() {
        var stack = Stack<Int>()
        try XCTAssertThrowsError(stack.pop(), "The stack should throw an error!")

        stack.push(1)
        try XCTAssertEqual(stack.pop(), 1, "The item was not peeked correctly!")
    }

    func testCount() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0, "The stack's length is not correct!");
        stack.push(1)
        XCTAssertEqual(stack.count, 1, "The stack's length is not correct!");
        stack.push(2)
        XCTAssertEqual(stack.count, 2, "The stack's length is not correct!");
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "The stack's length is not correct!");
    }

    func testIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty, "The stack should indicate it is empty!")
        stack.push(1)
        XCTAssertFalse(stack.isEmpty, "The stack is not empty!")
        try! stack.pop()
        XCTAssertTrue(stack.isEmpty, "The stack should indicate it is empty!")
    }

    func testRemoveAll() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.removeAll()
        XCTAssertTrue(stack.isEmpty, "The stack should be empty after removing all!")
    }

    func testToArray() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.toArray(), [3,2,1], "toArray does not perform correctly!")
    }
}
