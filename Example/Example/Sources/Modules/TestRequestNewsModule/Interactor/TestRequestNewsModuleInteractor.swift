//
//  TestRequestNewsModuleInteractor.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit
import FancyNetwork

// swiftlint:disable all
/// События которые отправляем из Interactor в Presenter
protocol TestRequestNewsModuleInteractorOutput: AnyObject {
  
  /// Были получены новости
  ///  - Parameter news: Модель Новостей
  func didRecive(news: TestRequestNewsModel)
}

/// События которые отправляем от Presenter к Interactor
protocol TestRequestNewsModuleInteractorInput {
  
  /// Получаем список новостей
  func getContent()
}

/// Интерактор
final class TestRequestNewsModuleInteractor: TestRequestNewsModuleInteractorInput {
  
  // MARK: - Internal properties
  
  weak var output: TestRequestNewsModuleInteractorOutput?
  
  // MARK: - Private properties
  
  private let networkRequestPerformer: NetworkService
  
  // MARK: - Initialization
  
  /// Инициализатор
  /// - Parameter networkRequestPerformer: Сетевой слой
  init(networkRequestPerformer: NetworkService) {
    self.networkRequestPerformer = networkRequestPerformer
  }
  
  func getContent() {
    networkRequestPerformer.performRequestWith(urlString: "https://api.spaceflightnewsapi.net/v3/info",
                                               queryItems: [],
                                               httpMethod: .get,
                                               headers: [.acceptJson, .contentTypeJson]) { [weak self] result in
      switch result {
      case .success(let data):
        if let model = self?.networkRequestPerformer.map(data, to: TestRequestNewsModel.self) {
          DispatchQueue.main.async {
            self?.output?.didRecive(news: model)
          }
        } else {
          print("Не получилось смапить данные")
        }
      case .failure(let error):
        switch error {
        case .noInternetConnection:
          print("Интернет отсутствует")
        case .invalidURLRequest:
          print("Ошибка в URL адрисе")
        case .unacceptedHTTPStatus(let code, let localizedDescription):
          print("Ошибка: \(String(describing: localizedDescription)), код ошибки: \(code)")
        case .unexpectedServerResponse:
          print("Сервер не отвечает")
        case .mappingError:
          print("mappingError")
        }
      }
    }
  }
}
// swiftlint:enable all
