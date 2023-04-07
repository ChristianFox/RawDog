import Foundation

infix operator ~+ : AdditionPrecedence
infix operator ~- : AdditionPrecedence
infix operator ~* : MultiplicationPrecedence
infix operator ~/ : MultiplicationPrecedence

/// Add arithmetic operator functions to a `RawRepresentable` type with the standard fallible initialiser: `init?(rawValue: RawValue)`
public protocol ArithmeticForFallibleType: RawRepresentable where RawValue: Numeric {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	/// Add one instance to the other
	static func + (lhs: Self, rhs: Self) -> Self?

	/// Subtract one instance from the other
	static func - (lhs: Self, rhs: Self) -> Self?

	/// Multiply one instance by the other
	static func * (lhs: Self, rhs: Self) -> Self?

	/// Divide one instance by the other
	static func / (lhs: Self, rhs: Self) -> Self?

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	/// Add a `RawValue` to the `RawRepresentable` type's `rawValue` and return a new instance of the type
	static func ~+ (lhs: Self, rhs: RawValue) -> Self?

	/// Subtract a `RawValue` from the `RawRepresentable` type's `rawValue` and return a new instance of the type
	static func ~- (lhs: Self, rhs: RawValue) -> Self?

	/// Multiply the `RawRepresentable` type's `rawValue` by the `RawValue` and return a new instance of the type
	static func ~* (lhs: Self, rhs: RawValue) -> Self?

	/// Divide the `RawRepresentable` type's `rawValue` by the `RawValue` and return a new instance of the type
	static func ~/ (lhs: Self, rhs: RawValue) -> Self?
}

public extension ArithmeticForFallibleType where RawValue: Numeric {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func + (lhs: Self, rhs: Self) -> Self? {
		Self.init(rawValue: lhs.rawValue + rhs.rawValue)
	}

	static func - (lhs: Self, rhs: Self) -> Self? {
		Self.init(rawValue: lhs.rawValue - rhs.rawValue)
	}

	static func * (lhs: Self, rhs: Self) -> Self? {
		Self.init(rawValue: lhs.rawValue * rhs.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~+ (lhs: Self, rhs: RawValue) -> Self? {
		Self.init(rawValue: lhs.rawValue + rhs)
	}

	static func ~- (lhs: Self, rhs: RawValue) -> Self? {
		Self.init(rawValue: lhs.rawValue - rhs)
	}

	static func ~* (lhs: Self, rhs: RawValue) -> Self? {
		Self.init(rawValue: lhs.rawValue * rhs)
	}
}

public extension ArithmeticForFallibleType where RawValue: BinaryFloatingPoint {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func / (lhs: Self, rhs: Self) -> Self? {
		Self.init(rawValue: lhs.rawValue / rhs.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~/ (lhs: Self, rhs: RawValue) -> Self? {
		Self.init(rawValue: lhs.rawValue / rhs)
	}

	// ------------------------------------
	// MARK: Standard Prefix Operators
	// ------------------------------------
	/// Negate the instance, a positive value becomes negative and vice versa
	static prefix func - (instance: Self) -> Self? {
		Self.init(rawValue: -instance.rawValue)
	}
}

public extension ArithmeticForFallibleType where RawValue: BinaryInteger {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	static func / (lhs: Self, rhs: Self) -> Self? {
		Self.init(rawValue: lhs.rawValue / rhs.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	static func ~/ (lhs: Self, rhs: RawValue) -> Self? {
		Self.init(rawValue: lhs.rawValue / rhs)
	}

	// ------------------------------------
	// MARK: Custom Division Methods
	// ------------------------------------
	/// Divide the receiver by `other` using the given `strategy`
	func divided(by other: Self, with strategy: BinaryIntegerDivisionStrategy) -> Self? {
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
	func divided(by other: RawValue, with strategy: BinaryIntegerDivisionStrategy) -> Self? {
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

public extension ArithmeticForFallibleType where RawValue: SignedInteger {

	// ------------------------------------
	// MARK: Standard Prefix Operators
	// ------------------------------------
	/// Negate the instance, a positive value becomes negative and vice versa
	static prefix func - (instance: Self) -> Self? {
		Self.init(rawValue: -instance.rawValue)
	}
}
