//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class HomePresenter {
    weak var viewController: HomeViewControllerProtocol?
    lazy var interactor: HomeInteractorProtocol = HomeInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & HomeRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? HomeRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & HomeRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? HomeViewController {
            return HomeRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = HomeViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: HomeRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension HomePresenter: HomeEventHandlerProtocol {
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
extension HomePresenter: HomePresenterProtocol {

}

