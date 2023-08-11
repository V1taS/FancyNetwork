import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Setup project

let project = Project(
  name: appName,
  organizationName: organizationName,
  options: .options(automaticSchemesOptions: .disabled),
  settings: projectBuildIOSSettings,
  targets: [
    Target(
      name: appName,
      platform: .iOS,
      product: .app,
      bundleId: "\(reverseOrganizationName).\(appName)",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
      infoPlist: getMainIOSInfoPlist(),
      sources: [
        "\(rootPath)/Sources/**/*",
      ],
      resources: [
        "\(rootPath)/Resources/**/*",
      ],
      scripts: [
        scriptSwiftLint
      ],
      dependencies: [
        .external(name: "FancyNetwork"),
      ],
      settings: targetBuildIOSSettings
    )
  ],
  schemes: [mainIOSScheme]
)
