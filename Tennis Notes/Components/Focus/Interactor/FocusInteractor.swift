//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class FocusInteractor {
    
    weak var presenter: FocusPresenterProtocol?
    lazy var entityGateway: FocusEntityGatewayProtocol = FocusEntityGateway(interactor: self)
    
    init(presenter: FocusPresenterProtocol) {
        self.presenter = presenter
    }

}

extension FocusInteractor: FocusInteractorProtocol {
    
    // MARK: In
    func fetchTargetNotes() -> [TargetNote] {
        entityGateway.fetchTargetNotes()
    }
    
    func fetchErrorNotes() -> [ErrorNote] {
        entityGateway.fetchErrorNotes()
    }
    
    // MARK: Out
}
