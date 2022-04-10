//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class NotesRouter: NSObject, RouterProtocol {

    weak var viewController: NotesViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: NotesViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension NotesRouter: NotesRouterProtocol {
    
}
