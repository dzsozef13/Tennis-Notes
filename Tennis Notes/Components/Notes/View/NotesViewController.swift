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
    
    // MARK: Notification
    private let notificationCenter: NotificationCenter = .default
    
    // MARK: Variables
    private var selectedTable: Table?

    // MARK: UI Objects

    // MARK: Interface Builder Outlets
    // Table Selectors
    @IBOutlet weak var tableSelectorPlayers: TableSelector?
    @IBOutlet weak var tableSelectorMatches: TableSelector?

    // MARK: Interface Builder Outlets

    // MARK: Interface Builder Actions
    @IBAction func didTapSelectorPlayers(_ sender: Any) {
        eventHandler.didTapSelectorPlayers()
        selectedTable = .players
        refreshTableSelectors()
    }
    
    @IBAction func didTapSelectorMatches(_ sender: Any) {
        eventHandler.didTapSelectorMatches()
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
        initializeTableSelectors()
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
        initializeTitle()
        initializeTableSelectors()
    }
    
    private func initializeTitle() {
        title = "Notes"
    }
    
    private func initializeTableSelectors() {
        // Set titles
        tableSelectorPlayers?.setTitleLabel(for: "Players")
        tableSelectorMatches?.setTitleLabel(for: "Matches")
        // Load saved case
        guard let usedShortcut: String = UserDefaults.standard.object(forKey: "SelectedNotesTable") as? Table.RawValue else {
            selectedTable = .players
            refreshTableSelectors()
            return
        }
        // Check if already selected
        if usedShortcut == Table.players.rawValue {
            selectedTable = .players
        }
        if usedShortcut == Table.matches.rawValue {
            selectedTable = .matches
        }
        // Update selectors
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
        default:
            tableSelectorPlayers?.activateSelector()
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

// MARK: Notification Events
extension NotesViewController {
    public func showTargetsTable() {
        selectedTable = .players
        refreshTableSelectors()
    }
    
    public func showErrorsTable() {
        selectedTable = .matches
        refreshTableSelectors()
    }
}
