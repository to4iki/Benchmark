import XCTest
@testable import Benchmark

final class BenchmarkTests: XCTestCase {
    
    func testRealTime() {
        measure {
            let time = Benchmark.realTime(label: "fib: ") { self.fibonacci(30) }
            print(time)
        }
    }
    
    func testMeasure() {
        measure {
            let measure = Benchmark.measure(label: "[fib]") { self.fibonacci(30) }
            print(measure)
        }
    }
    
    func testBm() {
        measure {
            Benchmark.bm(labels: ["total: ", "ave: "]) { (r: Benchmark.Report) -> [TimeInterval] in
                let one = r.time(label: "one: ") { self.fibonacci(30) }
                let two = r.time(label: "two: ") { self.fibonacci(30) }
                let three = r.time(label: "three: ") { self.fibonacci(30) }
                let total = one.elapsed + two.elapsed + three.elapsed
                let ave = total / 3
                return [total, ave]
            }
        }
    }
    
    static var allTests : [(String, (BenchmarkTests) -> () throws -> Void)] {
        return [
            ("testRealTime", testRealTime),
            ("testBm", testBm)
        ]
    }
}

extension BenchmarkTests {
    
    @discardableResult
    fileprivate func fibonacci(_ n: UInt) -> UInt {
        if n <= 1 {
            return n
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2)
        }
    }
}
