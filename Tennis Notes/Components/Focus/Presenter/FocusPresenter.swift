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
            guard let _ = routeModel as? FocusRouteModel else { return }
            // Initialize properties passed from route model
            refreshViewModel()
        }
    }
    
    // MARK: Notifications
    var notificationCenter = NotificationCenter.default

    // MARK: Routing data

    // MARK: Fetched data
    var targetNotes: [TargetNote] = []
    var errorNotes: [ErrorNote] = []
    
    // MARK: Variables
    private let userDefaults = UserDefaults.standard

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
        let viewModel = FocusViewModel(targetNotes: self.targetNotes, errorNotes: self.errorNotes)
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
        
        // Load notes
        presentTargetNotes()
        presentErrorNotes()
    }

    func willAppear() {
        viewController?.tableViewRefresh()
        viewController?.languageRefresh()
    }

    func traitCollectionDidChange() {
        viewController?.themeRefresh()
    }
    
    // MARK: Actions sent from UI
    func didTapSelectorTargets() {
        viewController?.tableViewRefresh()
        userDefaults.set(Table.targets.rawValue, forKey: "SelectedFocusTable")
    }
    
    func didTapSelectorErrors() {
        viewController?.tableViewRefresh()
        userDefaults.set(Table.errors.rawValue, forKey: "SelectedFocusTable")
    }

}

// MARK: Presenter
extension FocusPresenter: FocusPresenterProtocol {
    func presentTargetNotes() {
        self.targetNotes = interactor.fetchTargetNotes()
        refreshViewModel()
        viewController?.tableViewRefresh()
    }
    
    func presentErrorNotes() {
        self.errorNotes = interactor.fetchErrorNotes()
        refreshViewModel()
        viewController?.tableViewRefresh()
    }
}

