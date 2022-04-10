//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class HomeEntityGateway {
    weak var interactor: HomeInteractorProtocol?

    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
}

extension HomeEntityGateway: HomeEntityGatewayProtocol {
    
}
