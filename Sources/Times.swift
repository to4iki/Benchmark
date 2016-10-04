import Foundation

public extension Benchmark {
    
    public struct Times: CustomStringConvertible {
        
        fileprivate let label: String
        
        let elapsed: TimeInterval
        
        fileprivate var formatedElapsedTimeString: String {
            return String(format: "%.3f", elapsed)
        }
        
        public init(label: String = "", realTime: TimeInterval) {
            self.label = label
            self.elapsed = realTime
        }
        
        public var description: String {
            return "\(label)\(formatedElapsedTimeString)"
        }
    }
}
