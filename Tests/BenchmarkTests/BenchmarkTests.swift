import XCTest
@testable import Benchmark

final class BenchmarkTests: XCTestCase {
    
    func testRealTime() {
        measure {
            let _ = Benchmark.realTime { let _ = self.fibonacci(30) }
        }
    }
    
    func testBm() {
        measure {
            Benchmark.bm(labels: ["total: ", "ave: "]) { (r: Benchmark.Report) -> [TimeInterval] in
                let one = r.time(label: "one: ") { let _ = self.fibonacci(30) }
                let two = r.time(label: "two: ") { let _ = self.fibonacci(30) }
                let three = r.time(label: "three: ") { let _ = self.fibonacci(30) }
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
    
    fileprivate func fibonacci(_ n: UInt) -> UInt {
        if n <= 1 {
            return n
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2)
        }
    }
}
