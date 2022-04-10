//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class HomeRouter: NSObject, RouterProtocol {

    weak var viewController: HomeViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: HomeViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
