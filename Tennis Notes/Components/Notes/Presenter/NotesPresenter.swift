//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class NotesPresenter {
    weak var viewController: NotesViewControllerProtocol?
    lazy var interactor: NotesInteractorProtocol = NotesInteractor(presenter: self)
    lazy var router: (NSObjectProtocol & NotesRouterProtocol & RouterProtocol)? = self.setupRouter()

    var routeModel: RouteModelProtocol? {
        didSet {
            guard let routeModel = routeModel as? NotesRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }

    // MARK: Routing data

    // MARK: Fetched data
    
    // MARK: Varilables
    private let userDefaults = UserDefaults.standard

    init(viewController: NotesViewControllerProtocol) {
        self.viewController = viewController
    }

    func setupRouter() -> (NSObjectProtocol & NotesRouterProtocol & RouterProtocol)? {
        if let view = self.viewController as? NotesViewController {
            return NotesRouter(viewController: view)
        } else {
            return nil
        }
    }

    func refreshViewModel() {
        let viewModel = NotesViewModel()
        viewController?.viewModel = viewModel
    }

    func setRouteModel(model: NotesRouteModel) {
        self.routeModel = model
    }
}

// MARK: Event Handler
extension NotesPresenter: NotesEventHandlerProtocol {
    
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
    
    // MARK: Actions sent from UI
    func didTapSelectorPlayers() {
        userDefaults.set(Shortcut.players.rawValue, forKey: "SelectedNotesTable")
    }
    
    func didTapSelectorMatches() {
        userDefaults.set(Shortcut.matches.rawValue, forKey: "SelectedNotesTable")
    }
}

// MARK: Presenter
extension NotesPresenter: NotesPresenterProtocol {

}

