import Foundation

infix operator ~+ : AdditionPrecedence
infix operator ~- : AdditionPrecedence
infix operator ~* : MultiplicationPrecedence
infix operator ~/ : MultiplicationPrecedence
infix operator ~+= : AdditionPrecedence
infix operator ~-= : AdditionPrecedence
infix operator ~*= : MultiplicationPrecedence
infix operator ~/= : MultiplicationPrecedence

public protocol ArithmeticForInfallibleType: RawRepresentable where RawValue: Numeric {

	// ------------------------------------
	// MARK: Infallible initialiser
	// ------------------------------------
	/// Initialise an instance
	/// - Parameter rawValue: The `rawValue`
	init(rawValue: RawValue)

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	/// Add one instance to the other
	static func + (lhs: Self, rhs: Self) -> Self

	/// Subtract one instance from the other
	static func - (lhs: Self, rhs: Self) -> Self

	/// Multiply one instance by the other
	static func * (lhs: Self, rhs: Self) -> Self

	/// Divide one instance by the other
	static func / (lhs: Self, rhs: Self) -> Self

	/// Add the value to the receiver
	static func += (lhs: inout Self, rhs: Self)

	/// Subtract the value from the receiver
	static func -= (lhs: inout Self, rhs: Self)

	/// Multiply the receiver by the second instance
	static func *= (lhs: inout Self, rhs: Self)

	/// Divide the receiver by the second instance
	static func /= (lhs: inout Self, rhs: Self)

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	/// Add a `RawValue` to the `RawRepresentable` type's `rawValue` and return a new instance of the type
	static func ~+ (lhs: Self, rhs: RawValue) -> Self

	/// Subtract a `RawValue` from the `RawRepresentable` type's `rawValue` and return a new instance of the type
	static func ~- (lhs: Self, rhs: RawValue) -> Self

	/// Multiply the `RawRepresentable` type's `rawValue` by the `RawValue` and return a new instance of the type
	static func ~* (lhs: Self, rhs: RawValue) -> Self

	/// Divide the `RawRepresentable` type's `rawValue` by the `RawValue` and return a new instance of the type
	static func ~/ (lhs: Self, rhs: RawValue) -> Self

	/// Add a `RawValue` to the receiver's `rawValue`
	static func ~+= (lhs: inout Self, rhs: RawValue)

	/// Subtract a `RawValue` from the receiver's `rawValue`
	static func ~-= (lhs: inout Self, rhs: RawValue)

	/// Multiply the receiver's `rawValue` by the `RawValue`
	static func ~*= (lhs: inout Self, rhs: RawValue)

	/// Divide the receiver's `rawValue` by the `RawValue`
	static func ~/= (lhs: inout Self, rhs: RawValue)
}

public extension ArithmeticForInfallibleType where RawValue: Numeric {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func + (lhs: Self, rhs: Self) -> Self {
		Self.init(rawValue: lhs.rawValue + rhs.rawValue)
	}

	static func - (lhs: Self, rhs: Self) -> Self {
		Self.init(rawValue: lhs.rawValue - rhs.rawValue)
	}

	static func * (lhs: Self, rhs: Self) -> Self {
		Self.init(rawValue: lhs.rawValue * rhs.rawValue)
	}

	static func += (lhs: inout Self, rhs: Self) {
		lhs = lhs + rhs
	}

	static func -= (lhs: inout Self, rhs: Self) {
		lhs = lhs - rhs
	}

	static func *= (lhs: inout Self, rhs: Self) {
		lhs = lhs * rhs
	}

	static func /= (lhs: inout Self, rhs: Self) {
		lhs = lhs / rhs
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~+ (lhs: Self, rhs: RawValue) -> Self {
		Self.init(rawValue: lhs.rawValue + rhs)
	}

	static func ~- (lhs: Self, rhs: RawValue) -> Self {
		Self.init(rawValue: lhs.rawValue - rhs)
	}

	static func ~* (lhs: Self, rhs: RawValue) -> Self {
		Self.init(rawValue: lhs.rawValue * rhs)
	}

	static func ~+= (lhs: inout Self, rhs: RawValue) {
		lhs = lhs ~+ rhs
	}

	static func ~-= (lhs: inout Self, rhs: RawValue) {
		lhs = lhs ~- rhs
	}

	static func ~*= (lhs: inout Self, rhs: RawValue) {
		lhs = lhs ~* rhs
	}

	static func ~/= (lhs: inout Self, rhs: RawValue) {
		lhs = lhs ~/ rhs
	}
}

public extension ArithmeticForInfallibleType where RawValue: BinaryFloatingPoint {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func / (lhs: Self, rhs: Self) -> Self {
		Self.init(rawValue: lhs.rawValue / rhs.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~/ (lhs: Self, rhs: RawValue) -> Self {
		Self.init(rawValue: lhs.rawValue / rhs)
	}

	// ------------------------------------
	// MARK: Standard Prefix Operators
	// ------------------------------------
	/// Negate the instance, a positive value becomes negative and vice versa
	static prefix func - (instance: Self) -> Self {
		Self.init(rawValue: -instance.rawValue)
	}
}

public extension ArithmeticForInfallibleType where RawValue: BinaryInteger {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func / (lhs: Self, rhs: Self) -> Self {
		Self.init(rawValue: lhs.rawValue / rhs.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~/ (lhs: Self, rhs: RawValue) -> Self {
		Self.init(rawValue: lhs.rawValue / rhs)
	}

	// ------------------------------------
	// MARK: Custom Division Methods
	// ------------------------------------
	/// Divide the receiver by `other` using the given `strategy`
	func divided(by other: Self, with strategy: BinaryIntegerDivisionStrategy) -> Self {
		let result = Double(self.rawValue) / Double(other.rawValue)
		let rawValue: Self.RawValue
		switch strategy {
		case .floor:
			rawValue = Self.RawValue(floor(result))
		case .round:
			rawValue = Self.RawValue(round(result))
		case .ceiling:
			rawValue = Self.RawValue(ceil(result))
		}
		return Self.init(rawValue: rawValue)
	}

	/// Divide the receiver's `rawValue` by `other` using the given `strategy`
	func divided(by other: RawValue, with strategy: BinaryIntegerDivisionStrategy) -> Self {
		let result = Double(self.rawValue) / Double(other)
		let rawValue: Self.RawValue
		switch strategy {
		case .floor:
			rawValue = Self.RawValue(floor(result))
		case .round:
			rawValue = Self.RawValue(round(result))
		case .ceiling:
			rawValue = Self.RawValue(ceil(result))
		}
		return Self.init(rawValue: rawValue)
	}
}

public extension ArithmeticForInfallibleType where RawValue: SignedInteger {

	// ------------------------------------
	// MARK: Standard Prefix Operators
	// ------------------------------------
	/// Negate the instance, a positive value becomes negative and vice versa
	static prefix func - (instance: Self) -> Self {
		Self.init(rawValue: -instance.rawValue)
	}
}
