import XCTest
@testable import Benchmark

class BenchmarkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Benchmark().text, "Hello, World!")
    }


    static var allTests : [(String, (BenchmarkTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
