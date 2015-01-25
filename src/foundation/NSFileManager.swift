// © 2014 George King.
// Permission to use this file is granted in license-qk.txt.

import Foundation


let fileManager = NSFileManager.defaultManager()


func absolutePath(path: String) -> String {
  let cr = fileManager.fileSystemRepresentationWithPath(path)
  let ca = realpath(cr, nil)
  let a = fileManager.stringWithFileSystemRepresentation(ca, length: Int(strlen(ca)))
  free(ca)
  return a
}

func isPathFileOrDir(path: String) -> Bool {
  return fileManager.fileExistsAtPath(path)
}

func isPathFile(path: String) -> Bool {
  var isDir: ObjCBool = false
  let exists = fileManager.fileExistsAtPath(path, isDirectory: &isDir)
  return exists && !isDir
}

func isPathDir(path: String) -> Bool {
  var isDir: ObjCBool = false
  let exists = fileManager.fileExistsAtPath(path, isDirectory: &isDir)
  return exists && isDir
}

func removeFileOrDir(path: String) -> NSError? {
  var e: NSError? = nil
  fileManager.removeItemAtPath(path, error: &e)
  return e
}
