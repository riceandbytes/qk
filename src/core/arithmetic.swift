// © 2014 George King.
// Permission to use this file is granted in license-qk.txt.

import Foundation // required to get math.h as of swift 1.2.


protocol ArithmeticType: IntegerLiteralConvertible {
  func +(l: Self, r: Self) -> Self
  func -(l: Self, r: Self) -> Self
  func *(l: Self, r: Self) -> Self
  func /(l: Self, r: Self) -> Self
  func %(l: Self, r: Self) -> Self
  func ==(l: Self, r: Self) -> Bool
  func <(l: Self, r: Self) -> Bool
  func >(l: Self, r: Self) -> Bool
  func <=(l: Self, r: Self) -> Bool
  func >=(l: Self, r: Self) -> Bool
}


extension Int: ArithmeticType {}
extension I8: ArithmeticType {}
extension I16: ArithmeticType {}
extension I32: ArithmeticType {}
extension I64: ArithmeticType {}

extension Uns: ArithmeticType {}
extension U8: ArithmeticType {}
extension U16: ArithmeticType {}
extension U32: ArithmeticType {}
extension U64: ArithmeticType {}

extension Float: ArithmeticType {}
extension Double: ArithmeticType {}


func sqrt_f(f: Float) -> Float { return sqrtf(f) }
func ceil_f(f: Float) -> Float { return ceilf(f) }
func floor_f(f: Float) -> Float { return floorf(f) }
func round_f(f: Float) -> Float { return roundf(f) }

func sqrt_f(d: Double) -> Double { return sqrt(d) }
func ceil_f(d: Double) -> Double { return ceil(d) }
func floor_f(d: Double) -> Double { return floor(d) }
func round_f(d: Double) -> Double { return round(d) }

extension Float {
  var sqr: Float { return self * self }
  var sqrt: Float { return sqrt_f(self) }
  var ceil: Float { return ceil_f(self) }
  var floor: Float { return floor_f(self) }
  var round: Float { return round_f(self) }
}

extension Double {
  var sqr: Double { return self * self }
  var sqrt: Double { return sqrt_f(self) }
  var ceil: Double { return ceil_f(self) }
  var floor: Double { return floor_f(self) }
  var round: Double { return round_f(self) }
}


func sum<S: SequenceType where S.Generator.Element: ArithmeticType>(s: S) {
  typealias E = S.Generator.Element
  reduce(s, 0) { (accum: E, item: E) in return accum + item }
}

func prod<S: SequenceType where S.Generator.Element: ArithmeticType>(s: S) {
  typealias E = S.Generator.Element
  reduce(s, 1) { (accum: E, item: E) in return accum * item }
}

func clamp<T: ArithmeticType>(a: T, l: T, h: T) -> T {
  if a < l { return l }
  if a > h { return h }
  return a
}


func sign<T: ArithmeticType>(b: Bool) -> T {
  return b ? 1 : -1
}


struct POTSeq: SequenceType {
  let start: Int = 1
  func generate() -> GeneratorOf<Int> {
    var val: Int = start
    return GeneratorOf<Int> {
      let v = val
      val *= 2
      return v
    }
  }
}

struct HPOTSeq: SequenceType {
  let start: Int = 1
  func generate() -> GeneratorOf<Int> {
    var val: Int = start
    var pot: Bool = true
    return GeneratorOf<Int> {
      let v = val
      if v < 4 {
        val += 1
        return v
      }
      else if pot {
        val = (val * 3) / 2
      } else {
        val = (val * 4) / 3
      }
      pot = !pot
      return v
    }
  }
}
