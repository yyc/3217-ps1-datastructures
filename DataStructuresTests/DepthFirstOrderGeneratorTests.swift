// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class DepthFirstOrderGeneratorTests : XCTestCase {

    func testCyclicGraph() {
        let graphFileName = "graph_cycle"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "C"],
            "The DFS for \(graphFileName) is wrong!")
    }

    func testLinkedListGraph() {
        let graphFileName = "graph_linkedlist"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "D", "E"],
            "The DFS for \(graphFileName) is wrong!")
    }

    func testExampleGraph() {
        let graphFileName = "graph_example"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "F", "E", "C", "G"],
            "The DFS for \(graphFileName) is wrong!")
    }

    // Additional graph with cycles and reflexive nodes
    func testAdditionalGraph() {
        let graphFileName = "graph_additional"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
                       ["A", "B", "D", "E", "F", "G", "H", "C"],
                       "The BFS for \(graphFileName) is wrong!")
    }
    
    
    private func getResultantNodesForGraph(_ fileName: String, startNode: String) -> [String] {
        // You do not need to modify this function.
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")!
        let graph = NSDictionary(contentsOfFile: path)!
        let dfsGenerator = DepthFirstOrderGenerator(graph: graph as! Dictionary<String, Array<String>>, start: startNode)

        var nodes = [String]()
        for node in dfsGenerator {
            nodes.append(node as String)
        }
        return nodes
    }
}
