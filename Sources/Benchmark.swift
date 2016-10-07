import Foundation

public struct Benchmark {

    private init() {}
    
    public static func realTime(label: String = "", f: () -> Void) -> Time {
        let startTime = Date()
        f()
        let elapsed = Date().timeIntervalSince(startTime)
        return Time(label: label, elapsed: elapsed)
    }
    
    public static func measure(label: String = "", repeatCount: UInt = 10, f: () -> Void) -> Metrics {
        let times = (0...repeatCount).map { _ in realTime(label: label, f: f) }
        return Metrics(times: times)
    }
    
    public static func bm(f: (Report) -> Void) {
        let report = Report()
        f(report)
    }
    
    public static func bm(labels: [String], f: (Report) -> [TimeInterval]) {
        let report = Report()
        let timeIntervals = f(report)
        zip(labels, timeIntervals).map(Time.init).forEach { print($0) }
    }
}
