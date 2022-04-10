//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class SettingsRouter: NSObject, RouterProtocol {

    weak var viewController: SettingsViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: SettingsViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension SettingsRouter: SettingsRouterProtocol {
    
}
