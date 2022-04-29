//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import UIKit

class AddNoteRouter: NSObject, RouterProtocol {

    weak var viewController: AddNoteViewController?
    var routeModel: RouteModelProtocol?

    init(viewController: AddNoteViewController) {
        self.viewController = viewController
        super.init()
    }
}

extension AddNoteRouter: AddNoteRouterProtocol {
    
}
