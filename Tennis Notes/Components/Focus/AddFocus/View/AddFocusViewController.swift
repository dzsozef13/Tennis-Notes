//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddFocusViewController: UIViewController {

    lazy var eventHandler: AddFocusEventHandlerProtocol = AddFocusPresenter(viewController: self)
    var viewModel: AddFocusViewModel? {
        didSet {
            refresh()
        }
    }

    // MARK: Views

    // MARK: UI Constants

    // MARK: Variables

    // MARK: UI Objects

    // MARK: Interface Builder Outlets
    // Input fields
    @IBOutlet weak var titleTextView: UITextView?
    @IBOutlet weak var contentTextView: UITextView?
    // Top bar navigation items
    @IBOutlet weak var doneButton: UIBarButtonItem?
    
    // MARK: Interface Builder Actions
    @IBAction func didTapDone(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        eventHandler.didTapAdd(title: self.titleTextView?.text, content: self.contentTextView?.text)
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
    
    // MARK: Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Force keyboard to return when tapped outside
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

// MARK: Initialization
extension AddFocusViewController {
    private func initializeViews() {
        initializeTitle()
    }
    
    private func initializeTitle() {
        title = "Add Focus"
    }
}

// MARK: Refreshing
extension AddFocusViewController {
    private func refresh() {
        assert(Thread.isMainThread)
        // Refresh ViewController on ViewModel changes
    }
}

// MARK: View Controller Protocol
extension AddFocusViewController: AddFocusViewControllerProtocol {
    
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
    
    func dismissView() {
        self.dismiss(animated: true)
    }
}

extension AddFocusViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.doneButton?.isEnabled = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.doneButton?.isEnabled = false
    }
}
