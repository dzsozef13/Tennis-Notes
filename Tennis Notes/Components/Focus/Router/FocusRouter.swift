//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class FocusRouter: NSObject, RouterProtocol {

    weak var viewController: FocusViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: FocusViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension FocusRouter: FocusRouterProtocol {
    
}
