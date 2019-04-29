#!/usr/bin/env swift
import Foundation

func makeFile() throws {
  let pkgConfigPath = "/usr/local/lib/pkgconfig"
  let pkgConfigDir = URL(fileURLWithPath: pkgConfigPath)

  // Make /usr/local/lib/pkgconfig if it doesn't already exist
  if !FileManager.default.fileExists(atPath: pkgConfigPath) {
    try FileManager.default.createDirectory(at: pkgConfigDir,
                                            withIntermediateDirectories: true)
  }
  let failingPCPath = pkgConfigDir.appendingPathComponent("failingpc.pc")

  /// Emit the pkg-config file to the path

  let s = [
    "Name: FailingPC",
    "Description: A failing PC file",
    "Version: 1.0",
    "Libs: -L/usr/local/lib -lsqlite3",
    "Requires.private:",
    "Cflags: -I/usr/local/include",
  ].joined(separator: "\n")

  print("Writing pkg-config file to \(failingPCPath.path)...")

  try s.write(toFile: failingPCPath.path, atomically: true, encoding: .utf8)

  print("\nSuccessfully wrote pkg-config file!")
}

do {
  try makeFile()
} catch {
  print("error: \(error)")
  exit(-1)
}
