import Foundation

infix operator ** : MultiplicationPrecedence

func ** (lhs: Double, rhs: UInt) -> Double {
    return (1..<rhs).reduce(lhs) { (acc: Double, _) -> Double in
        acc * lhs
    }
}

func / (lhs: Double, rhs: Int) -> Double {
    return lhs / Double(rhs)
}
