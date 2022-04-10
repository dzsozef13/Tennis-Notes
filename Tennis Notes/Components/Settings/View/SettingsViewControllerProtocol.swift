//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol SettingsViewControllerProtocol: AnyObject {
    var eventHandler: SettingsEventHandlerProtocol { get }
    var viewModel: SettingsViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)

    func languageRefresh()
    func themeRefresh()
}