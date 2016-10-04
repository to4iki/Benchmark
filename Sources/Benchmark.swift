import Foundation

public struct Benchmark {

    private init() {}
    
    public static func bm(f: (Report) -> Void) {
        let report = Report()
        f(report)
    }
    
    public static func bm(labels: [String], f: (Report) -> [TimeInterval]) {
        let report = Report()
        let timeIntervals = f(report)
        zip(labels, timeIntervals).map(Times.init).forEach { print($0) }
    }
    
    public static func measure(label: String = "", f: () -> Void) -> Times {
        let startTime = Date()
        f()
        let elapsed = Date().timeIntervalSince(startTime)
        return Times(label: label, realTime: elapsed)
    }
}
