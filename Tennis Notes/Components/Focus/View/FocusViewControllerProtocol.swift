//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol FocusViewControllerProtocol: AnyObject {
    var eventHandler: FocusEventHandlerProtocol { get }
    var viewModel: FocusViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)

    func languageRefresh()
    func themeRefresh()
}