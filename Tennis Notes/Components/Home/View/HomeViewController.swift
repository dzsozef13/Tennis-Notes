//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var eventHandler: HomeEventHandlerProtocol = HomePresenter(viewController: self)
    var viewModel: HomeViewModel? {
        didSet {
            refresh()
        }
    }
    
    // MARK: Variables
    private var quotes: [Quote?] = []

    // MARK: Interface Builder Outlets
    // Quote labels
    @IBOutlet weak var quoteLabel: UILabel?
    @IBOutlet weak var quoteAuthorLabel: UILabel?
    
    // Shortcuts
    @IBOutlet weak var targetsShortcutView: PressableView?
    @IBOutlet weak var errorsShortcutView: PressableView?
    @IBOutlet weak var playersShortcutView: PressableView?
    @IBOutlet weak var matchesShortcutView: PressableView?
    
    // MARK: Interface Builder Actions
    // Shortcuts
    @IBAction func didTapTargetsShortcut(_ sender: Any) {
        eventHandler.didTapTargetsShortcut()
        tapTabItem(item: .targets)
    }
    @IBAction func didTapErrorsShortcut(_ sender: Any) {
        eventHandler.didTapErrorsShortcut()
        tapTabItem(item: .errors)
    }
    @IBAction func didTapPlayersShortcut(_ sender: Any) {
        eventHandler.didTapPlayersShortcut()
        tapTabItem(item: .players)
    }
    @IBAction func didTapMatchesShortcut(_ sender: Any) {
        eventHandler.didTapMatchesShortcut()
        tapTabItem(item: .matches)
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        eventHandler.didLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeQuotes()
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
extension HomeViewController {
    private func initializeViews() {
        // Initialize ViewController on load
        initializeTitle()
    }
    
    private func initializeTitle() {
        title = "Home"
    }
    
    private func initializeQuotes() {
        let manager = QuotesManager()
        self.quotes = manager.quotes
        let randomIndex = Int(arc4random_uniform(UInt32(quotes.count - 1)))
        let randomQuote = self.quotes[randomIndex]!
        printRandomQuote(quote: randomQuote)
    }
    
    private func printRandomQuote(quote: Quote) {
        self.quoteLabel?.text = "\("\"")\(quote.quote)\("\"")"
        self.quoteAuthorLabel?.text = "\("- ")\(quote.author)"
    }
}

// MARK: Refreshing
extension HomeViewController {
    private func refresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on ViewModel changes
    }
    
    private func tapTabItem(item: Shortcut) {
        tabBarController?.selectedIndex = item.tabBarItemIndex()
    }
}

// MARK: View Controller Protocol
extension HomeViewController: HomeViewControllerProtocol {
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

