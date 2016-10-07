import Foundation

public extension Benchmark {
    
    public struct Time {
        
        let label: String
        
        public let elapsed: TimeInterval
        
        fileprivate var roundedElapsed: TimeInterval {
            return round(elapsed * 1000) / 1000
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
        return "\(label)\(roundedElapsed)s"
    }
}
