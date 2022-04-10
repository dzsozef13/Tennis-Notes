//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class SettingsEntityGateway {
    weak var interactor: SettingsInteractorProtocol?

    init(interactor: SettingsInteractorProtocol) {
        self.interactor = interactor
    }
}

extension SettingsEntityGateway: SettingsEntityGatewayProtocol {
    
}
