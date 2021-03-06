// © 2014 George King.
// Permission to use this file is granted in license-qk.txt.

#if os(OSX)
  import AppKit
  #else
  import UIKit
#endif


enum EventKind {
  case KD
  case KU
  case FC
  case MD
  case MU
  case MM
}


class QKResponder: CRResponder {
  //var handlers: [EventKind -> (CREvent, CRView) -> ()] = []

  #if os(OSX)
  override func keyDown(e: CREvent) {
    println("QKResponder keyDown: \(e)")
  }
  
  override func keyUp(e: CREvent) {
    println("QKResponder keyUp: \(e)")
  }
  
  override func flagsChanged(e: CREvent) {
    println("QKResponder flagsChanged: \(e)")
  }
  
  override func mouseDown(e: CREvent) {
    println("QKResponder mouseDown: \(e)")
  }
  
  override func mouseUp(e: CREvent) {
    println("QKResponder mouseUp: \(e)")
  }
  #endif
}
