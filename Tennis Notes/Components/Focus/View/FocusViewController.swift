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
    private enum Table: Equatable {
        case targets
        case errors
    }
    
    // MARK: Variables
    private let defaults = UserDefaults.standard
    private var selectedTable: Table?

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
        initializeTitle()
        initializeTableSelectors()
    }
    
    private func initializeTitle() {
        title = "Focus"
    }
    
    private func initializeTableSelectors() {
        // Set titles
        tableSelectorTargets?.setTitleLabel(for: "Targets")
        tableSelectorErrors?.setTitleLabel(for: "Errors")
        // Load saved case
        guard let usedShortcut: String = UserDefaults.standard.object(forKey: "SelectedFocusTable") as? Shortcut.RawValue else {
            selectedTable = .targets
            refreshTableSelectors()
            return
        }
        // Check if already selected
        if usedShortcut == Shortcut.targets.rawValue {
            selectedTable = .targets
        }
        if usedShortcut == Shortcut.errors.rawValue {
            selectedTable = .errors
        }
        // Update selectors
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
        default:
            tableSelectorTargets?.activateSelector()
        }
    }
}

// MARK: View Controller Protocol
extension FocusViewController: FocusViewControllerProtocol {
    
    // MARK: Shortcuts
    @objc public func showTargetsTable() {
        eventHandler.didTapSelectorTargets()
        selectedTable = .targets
        refreshTableSelectors()
    }
    
    @objc public func showErrorsTable() {
        eventHandler.didTapSelectorErrors()
        selectedTable = .errors
        refreshTableSelectors()
    }
    
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

// MARK: Table View
extension FocusViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Add edit function?
    }
}

extension FocusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HintTableViewCell.identifier, for: indexPath) as! HintTableViewCell
        cell.setupView(icon: UIImage(systemName: "plus") ?? UIImage(), title: "New Target", message: "Add a new target you want to focus on next time you go to practice or play a match.")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
