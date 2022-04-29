//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddFocusRouter: NSObject, RouterProtocol {

    weak var viewController: AddFocusViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: AddFocusViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension AddFocusRouter: AddFocusRouterProtocol {
    
}
