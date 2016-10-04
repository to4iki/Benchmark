import Foundation

public extension Benchmark {
    
    public struct Report {
        
        public func output(label: String = "", f: () -> Void) -> Times {
            defer { print(times) }
            let startTime = Date()
            f()
            let times = Times(label: label, realTime: Date().timeIntervalSince(startTime))
            return times
        }
    }
}
