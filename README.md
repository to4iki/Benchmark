# Benchmark

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
#### bm
Invokes the function with a Benchmark.Report object, which may be used to collect and report on the results of individual benchmark tests.
```swift
let ROOP_COUNT = 100000

Benchmark.bm(labels: ["total: ", "ave: "]) { (r: Benchmark.Report) -> [TimeInterval] in
    let one = r.output(label: "for: ") { for i in 1...ROOP_COUNT { let _ = String(i) } }
    let two = r.output(label: "forEach: ") { (1...ROOP_COUNT).forEach({ let _ = String($0) }) }
    let total = one.elapsed + two.elapsed
    let ave = total / 2
    return [total, ave]
}

// for: 0.027
// forEach: 0.037
// total: 0.064
// ave: 0.032
```

#### mesure
Returns the elapsed time used to execute the given function as a Benchmark.Times object. Takes label option

```swift
let times = Benchmark.measure { sleep(3) }
print(times) // 3.0..
```

## Author

[to4iki](https://github.com/to4iki)

## Licence

[MIT](http://to4iki.mit-license.org/)

[license-url]: http://to4iki.mit-license.org/
[license-image]: http://img.shields.io/badge/license-MIT-brightgreen.svg

[swift-version]: https://img.shields.io/badge/Swift-3.0-orange.svg
