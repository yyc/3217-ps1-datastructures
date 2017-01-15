// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in breadth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2017
 */
struct BreadthFirstOrderGenerator<Key: Hashable, Value: Collection> : IteratorProtocol, Sequence where Value.Iterator.Element == Key {

    private var queue = Queue<Key>()
    private var set = Set<Key>()
    private var graph : Dictionary<Key, Value>
    /// Constructs a `BreadthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init(graph: Dictionary<Key, Value>, start: Key) {
        self.graph = graph
        queue.enqueue(start)
        set.insert(start)
    }

    func makeIterator() -> BreadthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        if(queue.isEmpty){
            return nil
        }
        
        let key = try! queue.dequeue()
        
        for neighbour in graph[key]!{
            if !set.contains(neighbour){
                queue.enqueue(neighbour)
                set.insert(neighbour)
            }
        }
        
        return key
    }
}
