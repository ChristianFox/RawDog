import Foundation
@testable import RawDog

struct FallibleRawDouble: RawRepresentable, ArithmeticForFallibleType {

	var rawValue: Double
}

struct FallibleRawInteger: RawRepresentable, ArithmeticForFallibleType {

	var rawValue: Int
}

struct InfallibleRawDouble: RawRepresentable, ArithmeticForInfallibleType {

	var rawValue: Double

	init(rawValue: Double) {
		self.rawValue = rawValue
	}
}

struct InfallibleRawInteger: RawRepresentable, ArithmeticForInfallibleType {

	var rawValue: Int

	init(rawValue: Int) {
		self.rawValue = rawValue
	}
}
