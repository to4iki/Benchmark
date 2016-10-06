import Foundation

public extension Benchmark {
    
    public struct Time {
        
        let label: String
        
        public let elapsed: TimeInterval
        
        fileprivate var formatedElapsedTimeString: String {
            return String(format: "%.3f", elapsed)
        }
        
        init(label: String = "", elapsed: TimeInterval) {
            self.label = label
            self.elapsed = elapsed
        }
    }
}

// MARK: - CustomStringConvertible

extension Benchmark.Time: CustomStringConvertible {
    
    public var description: String {
        return "\(label)\(formatedElapsedTimeString)"
    }
}
