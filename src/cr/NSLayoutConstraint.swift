// © 2014 George King.
// Permission to use this file is granted in license-qk.txt.

import Foundation

extension NSLayoutAttribute {
  
  var isSome: Bool { return self != .NotAnAttribute }
}


extension NSLayoutConstraint: Printable {
  override public var description: String { return "NSLayoutConstraint(l:\(firstAttribute), r:\(secondAttribute), m:\(multiplier), c:\(constant), p:\(priority)" }
}
