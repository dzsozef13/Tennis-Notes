//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol AddFocusViewControllerProtocol: AnyObject {
    var eventHandler: AddFocusEventHandlerProtocol { get }
    var viewModel: AddFocusViewModel? { get set }
    func performSegue(withIdentifier: String, sender: Any?)
    
    func dismissView()

    func languageRefresh()
    func themeRefresh()
}
