//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class SettingsPresenter {
    weak var viewController: SettingsViewControllerProtocol?
    lazy var interactor: SettingsInteractorProtocol = SettingsInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & SettingsRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? SettingsRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: SettingsViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & SettingsRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? SettingsViewController {
            return SettingsRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = SettingsViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: SettingsRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension SettingsPresenter: SettingsEventHandlerProtocol {
    func prepare(for segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    func didLoad() {
        viewController?.languageRefresh()
        // Place here component's initial load code
    }

    func willAppear() {
        viewController?.languageRefresh()
    }

    func traitCollectionDidChange() {
        viewController?.themeRefresh()
    }
}

// MARK: Presenter
extension SettingsPresenter: SettingsPresenterProtocol {

}

