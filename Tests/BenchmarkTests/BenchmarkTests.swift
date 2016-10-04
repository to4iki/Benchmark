import XCTest
@testable import Benchmark

final class BenchmarkTests: XCTestCase {
    
    func testBm() {
        measure {
            Benchmark.bm(labels: ["total: ", "ave: "]) { (r: Benchmark.Report) -> [TimeInterval] in
                let one = r.output(label: "one: ") { self.fibonacci(30) }
                let two = r.output(label: "two: ") { self.fibonacci(30) }
                let three = r.output(label: "three: ") { self.fibonacci(30) }
                let total = one.elapsed + two.elapsed + three.elapsed
                let ave = total / 3
                return [total, ave]
            }
        }
    }
    
    func testMeasure() {
        measure {
            Benchmark.measure { self.fibonacci(30) }
        }
    }
    
    static var allTests : [(String, (BenchmarkTests) -> () throws -> Void)] {
        return [
            ("testBm", testBm),
            ("testMeasure", testMeasure)
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
