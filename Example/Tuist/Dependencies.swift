import ProjectDescription

let dependencies = Dependencies(
  swiftPackageManager: SwiftPackageManagerDependencies(
    [.local(path: "../../FancyNetwork")]
  ),
  platforms: [.iOS]
)
