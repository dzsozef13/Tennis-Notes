//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class HomeInteractor {
    
    weak var presenter: HomePresenterProtocol?
    lazy var entityGateway: HomeEntityGatewayProtocol = HomeEntityGateway(interactor: self)
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }

}

extension HomeInteractor: HomeInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
}
