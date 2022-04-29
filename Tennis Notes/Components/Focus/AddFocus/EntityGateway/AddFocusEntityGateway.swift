//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class AddFocusEntityGateway {
    weak var interactor: AddFocusInteractorProtocol?

    init(interactor: AddFocusInteractorProtocol) {
        self.interactor = interactor
    }
}

extension AddFocusEntityGateway: AddFocusEntityGatewayProtocol {
    
}
