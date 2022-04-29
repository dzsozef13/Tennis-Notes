//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddNotePresenter {
    weak var viewController: AddNoteViewControllerProtocol?
    lazy var interactor: AddNoteInteractorProtocol = AddNoteInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & AddNoteRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? AddNoteRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: AddNoteViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & AddNoteRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? AddNoteViewController {
            return AddNoteRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = AddNoteViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: AddNoteRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension AddNotePresenter: AddNoteEventHandlerProtocol {
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
extension AddNotePresenter: AddNotePresenterProtocol {

}

