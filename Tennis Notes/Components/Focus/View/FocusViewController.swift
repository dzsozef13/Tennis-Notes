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
    
    // MARK: Fade Manager
    let fadeManager = DimView.fadeManager
    
    // MARK: Variables
    private let defaults = UserDefaults.standard
    private var selectedTable: Table?

    // MARK: Interface Builder Outlets
    // Main view
    @IBOutlet var mainView: UIView!
    // Table Selectors
    @IBOutlet weak var tableSelectorTargets: TableSelector?
    @IBOutlet weak var tableSelectorErrors: TableSelector?
    // Table View
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: Interface Builder Actions
    // Table Selector Actions
    @IBAction func didTapSelectorTargets(_ sender: Any) {
        selectedTable = .targets
        eventHandler.didTapSelectorTargets()
        refreshTableSelectors()
    }
    
    @IBAction func didTapSelectorErrors(_ sender: Any) {
        selectedTable = .errors
        eventHandler.didTapSelectorErrors()
        refreshTableSelectors()
    }
    
    @IBAction func didPanLeft(_ sender: Any) {
        selectedTable = .targets
        eventHandler.didTapSelectorTargets()
        refreshTableSelectors()
    }
    
    @IBAction func didPanRight(_ sender: Any) {
        selectedTable = .errors
        eventHandler.didTapSelectorErrors()
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
        // Fade in on appear
        fadeManager.fadeIn(fade: true, in: mainView, completionHandler: nil)
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
        self.navigationItem.title = "Focus 🎯"
    }
    
    private func initializeTableSelectors() {
        // Set titles
        tableSelectorTargets?.setTitleLabel(for: "Targets")
        tableSelectorErrors?.setTitleLabel(for: "Errors")
        // Load saved case
        guard let savedSelectedTable: String = UserDefaults.standard.object(forKey: "SelectedFocusTable") as? Table.RawValue else {
            selectedTable = .targets
            refreshTableSelectors()
            return
        }
        // Check if already selected
        if savedSelectedTable == Table.targets.rawValue {
            selectedTable = .targets
        }
        if savedSelectedTable == Table.errors.rawValue {
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
    
    // MARK: Table View Refreshing
    func tableViewRefresh() {
        assert(Thread.isMainThread)
        // Refresh TableView on data change
        self.tableView?.reloadData()
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
        guard let targetNotes = viewModel?.targetNotes, let errorNotes = viewModel?.errorNotes else { return 1 }
        switch selectedTable {
        case .targets:
            if !targetNotes.isEmpty {
                return targetNotes.count
            } else { return 1 }
        case .errors:
            if !errorNotes.isEmpty {
                return errorNotes.count
            } else { return 1 }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let targetNotes = viewModel?.targetNotes, let errorNotes = viewModel?.errorNotes else { return UITableViewCell() }
        let row = indexPath.row
        switch selectedTable {
        case .targets:
            if !targetNotes.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: TargetTableViewCell.identifier, for: indexPath) as! TargetTableViewCell
                cell.setupView(target: targetNotes[row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: HintTableViewCell.identifier, for: indexPath) as! HintTableViewCell
                cell.setupView(icon: UIImage(systemName: "plus") ?? UIImage(), title: "New Target", message: "Add a new target you want to focus on next time you go to practice or play a match.")
                return cell
            }
        case .errors:
            if !errorNotes.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: ErrorTableViewCell.identifier, for: indexPath) as! ErrorTableViewCell
                cell.setupView(error: errorNotes[row])
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: HintTableViewCell.identifier, for: indexPath) as! HintTableViewCell
                cell.setupView(icon: UIImage(systemName: "plus") ?? UIImage(), title: "New Target", message: "Add a new target you want to focus on next time you go to practice or play a match.")
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
