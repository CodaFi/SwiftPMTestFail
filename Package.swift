// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPMTestFail",
    products: [
      .library(
        name: "SwiftPMTestFail",
        targets: ["SwiftPMTestFail"]),
    ],
    targets: [
      .target(
        name: "SwiftPMTestFail",
        dependencies: ["failingpc"]),
      .systemLibrary(
        name: "failingpc",
        pkgConfig: "failingpc"),
      .testTarget(
          name: "SwiftPMTestFailTests",
          dependencies: ["SwiftPMTestFail"]),
    ],
    cxxLanguageStandard: .cxx14
)
