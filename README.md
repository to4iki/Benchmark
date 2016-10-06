# Benchmark

[![Build Status][status-image]][status-url]
[![License][license-image]][license-url]
![SwiftVersion][swift-version]

The Benchmark module provides methods to measure and report the time used to execute Swift code.

## Description
Inspired by Ruby [Benchmark](http://ruby-doc.org/stdlib-2.3.0/libdoc/benchmark/rdoc/Benchmark.html)

## Requirements
- Swift 3.0 or later
- iOS 8.0 or later

## Installation
#### [swift-package-manager](https://github.com/apple/swift-package-manager)
You can easily integrate Benchmark.swift in your app with SPM. Just add Benchmark.swift as a dependency:

```swift
import PackageDescription

let package = Package(
    name: "MyAwesomeApp",
    dependencies: [
        .Package(url: "https://github.com/to4iki/Benchmark.git", majorVersion: 0, minor: 1),
    ]
)
```

## Usage
#### realTime
Returns the elapsed real time used to execute the given function.

```swift
let time = Benchmark.realTime { sleep(3) }
print(time) // 3.0..
```

#### bm
Invokes the function with a Benchmark.Report object, which may be used to collect and report on the results of individual benchmark tests.
```swift
let n = 100000
Benchmark.bm(labels: ["total: ", "ave: "]) { (r: Benchmark.Report) -> [TimeInterval] in
    let one = r.time(label: "for: ") { for i in 1...n { String(i) } }
    let two = r.time(label: "forEach: ") { (1...n).forEach({ String($0) }) }
    let total = one.elapsed + two.elapsed
    let ave = total / 2
    return [total, ave]
}

// for: 0.027
// forEach: 0.037
// total: 0.064
// ave: 0.032
```

## Author

[to4iki](https://github.com/to4iki)

## Licence

[MIT](http://to4iki.mit-license.org/)

[status-url]: https://travis-ci.org/to4iki/Benchmark
[status-image]: https://travis-ci.org/to4iki/Benchmark.svg

[license-url]: http://to4iki.mit-license.org/
[license-image]: http://img.shields.io/badge/license-MIT-brightgreen.svg

[swift-version]: https://img.shields.io/badge/Swift-3.0-orange.svg
