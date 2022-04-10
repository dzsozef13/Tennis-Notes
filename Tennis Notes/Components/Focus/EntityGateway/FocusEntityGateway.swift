//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class FocusEntityGateway {
    weak var interactor: FocusInteractorProtocol?

    init(interactor: FocusInteractorProtocol) {
        self.interactor = interactor
    }
}

extension FocusEntityGateway: FocusEntityGatewayProtocol {
    
}
