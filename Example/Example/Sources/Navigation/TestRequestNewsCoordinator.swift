//
//  TestRequestNewsCoordinator.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit
import FancyNetwork

final class TestRequestNewsCoordinator: Coordinator {
  
  // MARK: - Private variables
  
  private let navigationController: UINavigationController
  private var testRequestNewsModule: TestRequestNewsModuleModule?
  private let networkRequestPerformer: NetworkService
  
  // MARK: - Initialization
  
  /// - Parameters:
  ///   - navigationController: UINavigationController
  ///   - networkRequestPerformer: Сетевой слой
  init(_ navigationController: UINavigationController,
       _ networkRequestPerformer: NetworkService) {
    self.navigationController = navigationController
    self.networkRequestPerformer = networkRequestPerformer
  }
  
  // MARK: - Internal func
  
  func start() {
    let moduleAssembly = TestRequestNewsModuleAssembly()
    let testRequestNewsModule = moduleAssembly.createModule(networkRequestPerformer: networkRequestPerformer)
    self.testRequestNewsModule = testRequestNewsModule
    navigationController.pushViewController(testRequestNewsModule, animated: true)
  }
}
