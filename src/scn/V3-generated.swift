// © 2014-2015 George King.
// Permission to use this file is granted in license-qk.txt.
// This file is generated by gen-math.py.

  
import CoreGraphics

extension V3: Printable {
  init(_ x: Flt = 0, _ y: Flt = 0, _ z: Flt = 0) {
    self.x = x
    self.y = y
    self.z = z
  }
  init(_ v: V3S) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V3D) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V3I) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V4S) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V4D) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V4I) {
    self.x = Flt(v.x)
    self.y = Flt(v.y)
    self.z = Flt(v.z)
  }
  init(_ v: V2, _ s: Flt) {
    self.x = v.x
    self.y = v.y
    self.z = s
  }
  static let zero = V3(0, 0, 0)
  public var description: String { return "V3(\(x), \(y), \(z))" }
  var vs: V3S { return V3S(F32(x), F32(y), F32(z)) }
  var vd: V3D { return V3D(F64(x), F64(y), F64(z)) }
  var len: Flt { return (x.sqr + y.sqr + z.sqr).sqrt }
  var norm: V3 { return self / self.len }
  var clampToUnit: V3 { return V3(clamp(x, 0, 1), clamp(y, 0, 1), clamp(z, 0, 1)) }
  var r: Flt { return x }
  var g: Flt { return y }
  var b: Flt { return z }
}

func +(a: V3, b: V3) -> V3 { return V3(a.x + b.x, a.y + b.y, a.z + b.z) }
func -(a: V3, b: V3) -> V3 { return V3(a.x - b.x, a.y - b.y, a.z - b.z) }
func *(a: V3, b: V3) -> V3 { return V3(a.x * b.x, a.y * b.y, a.z * b.z) }
func /(a: V3, b: V3) -> V3 { return V3(a.x / b.x, a.y / b.y, a.z / b.z) }
func +(a: V3, s: Flt) -> V3 { return V3(a.x + s, a.y + s, a.z + s) }
func -(a: V3, s: Flt) -> V3 { return V3(a.x - s, a.y - s, a.z - s) }
func *(a: V3, s: Flt) -> V3 { return V3(a.x * s, a.y * s, a.z * s) }
func /(a: V3, s: Flt) -> V3 { return V3(a.x / s, a.y / s, a.z / s) }

