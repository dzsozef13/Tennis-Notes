//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddFocusPresenter {
    weak var viewController: AddFocusViewControllerProtocol?
    lazy var interactor: AddFocusInteractorProtocol = AddFocusInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & AddFocusRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? AddFocusRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data

    init(viewController: AddFocusViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & AddFocusRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? AddFocusViewController {
            return AddFocusRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = AddFocusViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: AddFocusRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension AddFocusPresenter: AddFocusEventHandlerProtocol {
    
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
    
    func didTapDone() {
        return
    }
    
    func didTapAdd(title: String?, content: String?) {
        interactor.createNote(title: title, content: content)
        viewController?.dismissView()
    }
}

// MARK: Presenter
extension AddFocusPresenter: AddFocusPresenterProtocol {

}

