//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol AddNoteViewControllerProtocol: AnyObject {
    var eventHandler: AddNoteEventHandlerProtocol { get }
    var viewModel: AddNoteViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)

    func languageRefresh()
    func themeRefresh()
}