//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    lazy var eventHandler: NotesEventHandlerProtocol = NotesPresenter(viewController: self)
    var viewModel: NotesViewModel? {
        didSet {
            refresh()
        }
    }

    // MARK: Table Cases
    enum Table: Equatable {
        case players
        case matches
    }
    
    // MARK: Variables
    private var selectedTable: Table = .players

    // MARK: UI Objects

    // MARK: Interface Builder Outlets
    // Table Selectors
    @IBOutlet weak var tableSelectorPlayers: TableSelector?
    @IBOutlet weak var tableSelectorMatches: TableSelector?

    // MARK: Interface Builder Outlets

    // MARK: Interface Builder Actions
    @IBAction func didTapSelectorPlayers(_ sender: Any) {
//        eventHandler.didTapSelectorTargets()
        selectedTable = .players
        refreshTableSelectors()
    }
    
    @IBAction func didTapSelectorMatches(_ sender: Any) {
//        eventHandler.didTapSelectorErrors()
        selectedTable = .matches
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
extension NotesViewController {
    private func initializeViews() {
        // Initialize ViewController on load
        initializeTableSelectors()
    }
    
    private func initializeTableSelectors() {
        // Set titles
        tableSelectorPlayers?.setTitleLabel(for: "Players")
        tableSelectorMatches?.setTitleLabel(for: "Matches")

        refreshTableSelectors()
    }
}

// MARK: Refreshing
extension NotesViewController {
    private func refresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on ViewModel changes
    }
    
    private func refreshTableSelectors() {
        // Deactivate all
        tableSelectorPlayers?.deactivateSelector()
        tableSelectorMatches?.deactivateSelector()
        // Select expected
        switch selectedTable {
        case .players:
            tableSelectorPlayers?.activateSelector()
        case .matches:
            tableSelectorMatches?.activateSelector()
        }
    }
}

// MARK: View Controller Protocol
extension NotesViewController: NotesViewControllerProtocol {
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

