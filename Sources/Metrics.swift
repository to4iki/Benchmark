import Foundation

extension Benchmark {
    
    typealias STDDEV = Int
    
    public struct Metrics {
        
        private let times: [Time]

        /// if needed label with linefeed
        fileprivate var formatedLabel: String {
            guard let label = times.first?.label else { return "" }
            return "\(label)\n"
        }
        
        /// average
        fileprivate var ave: TimeInterval {
            let total = times.reduce(0.0) { $0 + $1.elapsed  }
            let rawAve = (total / times.count) * 1000
            return round(rawAve) / 1000
        }
        
        /// deviation squares
        fileprivate var devsq: Double {
            let multiple: (Time) -> TimeInterval = { ($0.elapsed - self.ave) ** 2 }
            return times.map(multiple).reduce(0, +)
        }
    
        /// variance
        fileprivate var variance: Double {
            return devsq / times.count
        }
        
        /// standard deviation
        fileprivate var stddev: STDDEV {
            return Int(round(sqrt(variance)))
        }
        
        init(times: [Time]) {
            self.times = times
        }
    }
}

// MARK: - CustomStringConvertible

extension Benchmark.Metrics: CustomStringConvertible {
    
    public var description: String {
        return "\(formatedLabel)average: \(ave)s\nSTDDEV: \(stddev)%"
    }
}
