import Foundation

public extension Benchmark {
    
    public struct Report {
        
        public func time(label: String = "", f: () -> Void) -> Time {
            defer { print(times) }
            let startTime = Date()
            f()
            let times = Time(label: label, elapsed: Date().timeIntervalSince(startTime))
            return times
        }
    }
}
