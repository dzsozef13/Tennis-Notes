//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol HomeViewControllerProtocol: AnyObject {
    var eventHandler: HomeEventHandlerProtocol { get }
    var viewModel: HomeViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)

    func languageRefresh()
    func themeRefresh()
}