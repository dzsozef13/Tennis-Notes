//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol NotesViewControllerProtocol: AnyObject {
    var eventHandler: NotesEventHandlerProtocol { get }
    var viewModel: NotesViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)

    func languageRefresh()
    func themeRefresh()
}