//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class SettingsInteractor {
    
    weak var presenter: SettingsPresenterProtocol?
    lazy var entityGateway: SettingsEntityGatewayProtocol = SettingsEntityGateway(interactor: self)
    
    init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }

}

extension SettingsInteractor: SettingsInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
}
