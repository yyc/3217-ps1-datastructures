// Copyright (c) 2017 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class Dictionary_TraversableTests : XCTestCase {

    func testExampleGraph() {
        let graphFileName = "graph_example"
        let graph = getGraph(graphFileName) as! Dictionary<String, Array<String>>
        let nodeA = "A"
        
        var bfsGenerator = graph.breadthFirstOrderGeneratorFromNode(nodeA)
        XCTAssertEqual(bfsGenerator.next(), "A", "First node of bfs for \(graphFileName) from \(nodeA) should be 'A'!")
        XCTAssertEqual(bfsGenerator.next(), "B", "Second node of bfs for \(graphFileName) from \(nodeA) should be 'B'!")
        XCTAssertEqual(bfsGenerator.next(), "C", "Third node of bfs for \(graphFileName) from \(nodeA) should be 'C'!")
        XCTAssertEqual(bfsGenerator.next(), "E", "Fourth node of bfs for \(graphFileName) from \(nodeA) should be 'E'!")
        XCTAssertEqual(bfsGenerator.next(), "D", "Fifth node of bfs for \(graphFileName) from \(nodeA) should be 'D'!")
        XCTAssertEqual(bfsGenerator.next(), "F", "Sixth node of bfs for \(graphFileName) from \(nodeA) should be 'F'!")
        XCTAssertEqual(bfsGenerator.next(), "G", "Seventh node of bfs for \(graphFileName) from \(nodeA) should be 'G'!")
        
        let bfsNodes = graph.nodesSequenceInBreadthFirstOrderFromNode(nodeA)
        XCTAssertEqual(bfsNodes, ["A", "B", "C", "E", "D", "F", "G"],
            "The bfs for \(graphFileName) from \(nodeA) is wrong!")
        
        var dfsGenerator = graph.depthFirstOrderGeneratorFromNode(nodeA)
        XCTAssertEqual(dfsGenerator.next(), "A", "First node of dfs for \(graphFileName) from \(nodeA) should be 'A'!")
        XCTAssertEqual(dfsGenerator.next(), "B", "Second node of dfs for \(graphFileName) from \(nodeA) should be 'B'!")
        XCTAssertEqual(dfsGenerator.next(), "D", "Third node of dfs for \(graphFileName) from \(nodeA) should be 'D'!")
        XCTAssertEqual(dfsGenerator.next(), "F", "Fourth node of dfs for \(graphFileName) from \(nodeA) should be 'F'!")
        XCTAssertEqual(dfsGenerator.next(), "E", "Fifth node of dfs for \(graphFileName) from \(nodeA) should be 'E'!")
        XCTAssertEqual(dfsGenerator.next(), "C", "Sixth node of dfs for \(graphFileName) from \(nodeA) should be 'C'!")
        XCTAssertEqual(dfsGenerator.next(), "G", "Seventh node of dfs for \(graphFileName) from \(nodeA) should be 'G'!")
        
        let dfsNodes = graph.nodesSequenceInDepthFirstOrderFromNode(nodeA)
        XCTAssertEqual(dfsNodes, ["A", "B", "D", "F", "E", "C", "G"],
            "The dfs for \(graphFileName) from \(nodeA) is wrong!")
    }

    private func getGraph(_ fileName: String) -> NSDictionary {
        // You do not need to modify this function.
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")!
        return NSDictionary(contentsOfFile: path)!
    }
}
