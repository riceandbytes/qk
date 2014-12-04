// © 2014 George King.
// Permission to use this file is granted in license-qk.txt.

import CoreGraphics


typealias Flt = CGFloat
typealias V2 = CGPoint

func sqr(a: Flt) -> Flt { return a * a }
func sqrrt(a: Flt) -> Flt { return sqrt(a) }


extension CGPoint: Printable {
  
  init(_ x: Flt, _ y: Flt) { self.init(x: x, y: y) }
  
  static let zero = CGPoint.zeroPoint

  public var description: String { return "V2(\(x), \(y))" }
  var v32: V2F32 { return V2F32(F32(x), F32(y)); }
  var len: Flt { return sqrrt(sqr(x) + sqr(y)) }
  var norm: V2 { return self / self.len }
  var clampToUnit: V2 { return V2(clamp(x, 0, 1), clamp(y, 0, 1)) }
}

func +(a: V2, b: V2) -> V2 { return V2(a.x + b.x, a.y + b.y) }
func -(a: V2, b: V2) -> V2 { return V2(a.x - b.x, a.y - b.y) }
func *(a: V2, b: V2) -> V2 { return V2(a.x * b.x, a.y * b.y) }
func /(a: V2, b: V2) -> V2 { return V2(a.x / b.x, a.y / b.y) }
func +(a: V2, s: Flt) -> V2 { return V2(a.x + s, a.y + s) }
func -(a: V2, s: Flt) -> V2 { return V2(a.x - s, a.y - s) }
func *(a: V2, s: Flt) -> V2 { return V2(a.x * s, a.y * s) }
func /(a: V2, s: Flt) -> V2 { return V2(a.x / s, a.y / s) }


extension CGSize {

  init(_ w: Flt, _ h: Flt) { self.init(width: w, height: h) }
  
  static let zero = CGSize.zeroSize
  
  var w: Flt {
    get { return width }
    set(w) { width = w }
  }

  var h: Flt {
    get { return height }
    set(h) { height = h }
  }
  
  var v: V2 { return V2(w, h); }
}


extension CGRect {
  
  init(_ x: Flt, _ y: Flt, _ w: Flt, _ h: Flt) { self.init(x: x, y: y, width: w, height: h) }

  init(_ w: Flt, _ h: Flt) { self.init(0, 0, w, h) }
  
  init(_ o: CGPoint, _ s: CGSize) { self.init(o.x, o.y, s.w, s.h) }

  init(_ s: CGSize) { self.init(0, 0, s.w, s.h) }
  
  static let zero = CGRect.zeroRect
  
  var o: CGPoint {
    get { return origin }
    set(o) { origin = o }
  }
  
  var s: CGSize {
    get { return size }
    set(s) { size = s }
  }
  
  var x: Flt {
    get { return o.x }
    set(x) { o = CGPoint(x, o.y) }
  }
  
  var y: Flt {
    get { return o.y }
    set(y) { o = CGPoint(o.x, y) }
  }
  
  var w: Flt {
    get { return s.w }
    set(w) { s = CGSize(w, s.h) }
  }
  
  var h: Flt {
    get { return s.h }
    set(h) { s = CGSize(s.w, h) }
  }
}