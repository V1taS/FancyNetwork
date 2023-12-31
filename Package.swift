// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FancyNetwork",
  products: [
    .library(
      name: "FancyNetwork",
      targets: ["FancyNetwork"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FancyNetwork",
      dependencies: []
    ),
    .testTarget(
      name: "FancyNetworkTests",
      dependencies: ["FancyNetwork"]
    ),
  ]
)
