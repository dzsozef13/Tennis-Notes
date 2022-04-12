//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class FocusViewController: UIViewController {

    lazy var eventHandler: FocusEventHandlerProtocol = FocusPresenter(viewController: self)
    var viewModel: FocusViewModel? {
        didSet {
            refresh()
        }
    }

    // MARK: Table Cases
    enum Table: Equatable {
        case targets
        case errors
    }
    
    // MARK: Variables
    private var selectedTable: Table = .targets

    // MARK: UI Objects

    // MARK: Interface Builder Outlets
    // Table Selectors
    @IBOutlet weak var tableSelectorTargets: TableSelector?
    @IBOutlet weak var tableSelectorErrors: TableSelector?
    
    // MARK: Interface Builder Actions
    // Table Selector Actions
    @IBAction func didTapSelectorTargets(_ sender: Any) {
        eventHandler.didTapSelectorTargets()
        selectedTable = .targets
        refreshTableSelectors()
    }
    
    @IBAction func didTapSelectorErrors(_ sender: Any) {
        eventHandler.didTapSelectorErrors()
        selectedTable = .errors
        refreshTableSelectors()
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        eventHandler.didLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeViews()
        eventHandler.willAppear()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        eventHandler.traitCollectionDidChange()
    }

    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        eventHandler.prepare(for: segue)
    }
}

// MARK: Initialization
extension FocusViewController {
    private func initializeViews() {
        // Initialize ViewController on load
        initializeTableSelectors()
    }
    
    private func initializeTableSelectors() {
        // Set titles
        tableSelectorTargets?.setTitleLabel(for: "Targets")
        tableSelectorErrors?.setTitleLabel(for: "Errors")

        refreshTableSelectors()
    }
}

// MARK: Refreshing
extension FocusViewController {
    private func refresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on ViewModel changes
    }
    
    private func refreshTableSelectors() {
        // Deactivate all
        tableSelectorTargets?.deactivateSelector()
        tableSelectorErrors?.deactivateSelector()
        // Select expected
        switch selectedTable {
        case .targets:
            tableSelectorTargets?.activateSelector()
        case .errors:
            tableSelectorErrors?.activateSelector()
        }
    }
}

// MARK: View Controller Protocol
extension FocusViewController: FocusViewControllerProtocol {
    
    // MARK: Language Refreshing
    func languageRefresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on language change
    }

    // MARK: Theme Refreshing
    func themeRefresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on theme change
    }
}

// MARK: Animations
extension FocusViewController {
    private func animateTableSelectorSelect(selector: UIView) {
        UIView.animate(withDuration: 0.05, delay: 0, options: .curveEaseInOut, animations: {
            selector.backgroundColor
        }, completion: nil)
    }
}

