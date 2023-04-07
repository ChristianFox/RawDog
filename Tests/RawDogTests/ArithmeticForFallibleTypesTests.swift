import XCTest
@testable import RawDog

final class ArithmeticForFallibleTypesTests: XCTestCase {

	// ------------------------------------
	// MARK: Standard Infix Operators
	// ------------------------------------
	func testInfixOperators_RawValueDouble() {

		// GIVEN
		let a = FallibleRawDouble(rawValue: 10)
		let b = FallibleRawDouble(rawValue: 5)

		// WHEN
		let add = a + b
		let subtract = a - b
		let multiply = a * b
		let divide = a / b

		// THEN
		XCTAssertEqual(15, add?.rawValue)
		XCTAssertEqual(5, subtract?.rawValue)
		XCTAssertEqual(50, multiply?.rawValue)
		XCTAssertEqual(2, divide?.rawValue)
	}

	func testInfixOperators_RawValueInteger() {

		// GIVEN
		let a = FallibleRawInteger(rawValue: 10)
		let b = FallibleRawInteger(rawValue: 5)

		// WHEN
		let add = a + b
		let subtract = a - b
		let multiply = a * b
		let divide = a / b

		// THEN
		XCTAssertEqual(15, add?.rawValue)
		XCTAssertEqual(5, subtract?.rawValue)
		XCTAssertEqual(50, multiply?.rawValue)
		XCTAssertEqual(2, divide?.rawValue)
	}

	// ------------------------------------
	// MARK: Standard Prefix Operators
	// ------------------------------------
	func testPrefixOperators_RawValueDouble() {

		// GIVEN
		let a = FallibleRawDouble(rawValue: 10)
		let b = FallibleRawDouble(rawValue: -5)

		// WHEN
		let aNegated = -a
		let bNegated = -b

		// THEN
		XCTAssertEqual(-10, aNegated?.rawValue)
		XCTAssertEqual(5, bNegated?.rawValue)
	}

	func testPrefixOperators_RawValueInteger() {

		// GIVEN
		let a = FallibleRawInteger(rawValue: 10)
		let b = FallibleRawInteger(rawValue: -5)

		// WHEN
		let aNegated = -a
		let bNegated = -b

		// THEN
		XCTAssertEqual(-10, aNegated?.rawValue)
		XCTAssertEqual(5, bNegated?.rawValue)
	}

	// ------------------------------------
	// MARK: Custom Infix Operators
	// ------------------------------------
	func testCustomInfixOperators_RawValueDouble() {

		// GIVEN
		let a = FallibleRawDouble(rawValue: 10)
		let b: Double = 5.0

		// WHEN
		let add = a ~+ b
		let subtract = a ~- b
		let multiply = a ~* b
		let divide = a ~/ b

		// THEN
		XCTAssertEqual(15, add?.rawValue)
		XCTAssertEqual(5, subtract?.rawValue)
		XCTAssertEqual(50, multiply?.rawValue)
		XCTAssertEqual(2, divide?.rawValue)
	}

	func testCustomInfixOperators_RawValueInteger() {

		// GIVEN
		let a = FallibleRawInteger(rawValue: 10)
		let b: Int = 5

		// WHEN
		let add = a ~+ b
		let subtract = a ~- b
		let multiply = a ~* b
		let divide = a ~/ b

		// THEN
		XCTAssertEqual(15, add?.rawValue)
		XCTAssertEqual(5, subtract?.rawValue)
		XCTAssertEqual(50, multiply?.rawValue)
		XCTAssertEqual(2, divide?.rawValue)
	}

	// ------------------------------------
	// MARK: divided(by: Self, with:)
	// ------------------------------------
	func testDividedByTypeWithStrategy() {

		// GIVEN
		let a = FallibleRawInteger(rawValue: 10)
		let b = FallibleRawInteger(rawValue: 4)
		let c = FallibleRawInteger(rawValue: 3)

		// WHEN
		let bFloored = a.divided(by: b, with: .floor)
		let cFloored = a.divided(by: c, with: .floor)
		let bRounded = a.divided(by: b, with: .round)
		let cRounded = a.divided(by: c, with: .round)
		let bCeiling = a.divided(by: b, with: .ceiling)
		let cCeiling = a.divided(by: c, with: .ceiling)

		// THEN
		XCTAssertEqual(2, bFloored?.rawValue)
		XCTAssertEqual(3, cFloored?.rawValue)
		XCTAssertEqual(3, bRounded?.rawValue)
		XCTAssertEqual(3, cRounded?.rawValue)
		XCTAssertEqual(3, bCeiling?.rawValue)
		XCTAssertEqual(4, cCeiling?.rawValue)
	}

	// ------------------------------------
	// MARK: divided(by: RawValue, with:)
	// ------------------------------------
	func testDividedByRawValueWithStrategy() {

		// GIVEN
		let a = FallibleRawInteger(rawValue: 10)
		let b: Int = 4
		let c: Int = 3

		// WHEN
		let bFloored = a.divided(by: b, with: .floor)
		let cFloored = a.divided(by: c, with: .floor)
		let bRounded = a.divided(by: b, with: .round)
		let cRounded = a.divided(by: c, with: .round)
		let bCeiling = a.divided(by: b, with: .ceiling)
		let cCeiling = a.divided(by: c, with: .ceiling)

		// THEN
		XCTAssertEqual(2, bFloored?.rawValue)
		XCTAssertEqual(3, cFloored?.rawValue)
		XCTAssertEqual(3, bRounded?.rawValue)
		XCTAssertEqual(3, cRounded?.rawValue)
		XCTAssertEqual(3, bCeiling?.rawValue)
		XCTAssertEqual(4, cCeiling?.rawValue)
	}
}
