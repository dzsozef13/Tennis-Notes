//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    lazy var eventHandler: AddNoteEventHandlerProtocol = AddNotePresenter(viewController: self)
    var viewModel: AddNoteViewModel? {
        didSet {
            refresh()
        }
    }

    // MARK: Views

    // MARK: UI Constants

    // MARK: Variables

    // MARK: UI Objects

    // MARK: Interface Builder Outlets

    // MARK: Interface Builder Actions

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
extension AddNoteViewController {
    private func initializeViews() {
        // Initialize ViewController on load
        initializeTitle()
    }
    
    private func initializeTitle() {
        title = "Add Note"
    }
}

// MARK: Refreshing
extension AddNoteViewController {
    private func refresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on ViewModel changes
    }
}

// MARK: View Controller Protocol
extension AddNoteViewController: AddNoteViewControllerProtocol {
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

