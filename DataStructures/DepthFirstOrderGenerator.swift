// Copyright (c) 2017 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in depth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2017
 */
struct DepthFirstOrderGenerator<Key: Hashable, Value: Collection> : IteratorProtocol, Sequence where Value.Iterator.Element == Key {

    private var stack = Stack<Key>()
    
    // Use a set to ensure that no node is traversed twice
    private var set = Set<Key>()
    
    private var graph : Dictionary<Key, Value>
    
    
    /// Constructs a `DepthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init(graph: Dictionary<Key, Value>, start: Key) {
        stack.push(start)
        self.graph = graph
    }

    func makeIterator() -> DepthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        // TODO: Replace/remove the following line in your implementation.
        if(stack.isEmpty){
            return nil
        }
        
        let key = try! stack.pop()
        
        if set.contains(key){
            return next()
        }
        set.insert(key)
        
        if graph[key] != nil {
            for neighbour in graph[key]!.reversed(){
                if(!set.contains(neighbour)){
                    // Add node to stack if it was not previously traversed
                    stack.push(neighbour)
                }
            }
        }
        
        return key
    }
}
