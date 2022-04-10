//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class FocusPresenter {
    weak var viewController: FocusViewControllerProtocol?
    lazy var interactor: FocusInteractorProtocol = FocusInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & FocusRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? FocusRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: FocusViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & FocusRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? FocusViewController {
            return FocusRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = FocusViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: FocusRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension FocusPresenter: FocusEventHandlerProtocol {
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
extension FocusPresenter: FocusPresenterProtocol {

}

