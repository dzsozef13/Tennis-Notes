//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class AddNoteInteractor {
    
    weak var presenter: AddNotePresenterProtocol?
    lazy var entityGateway: AddNoteEntityGatewayProtocol = AddNoteEntityGateway(interactor: self)
    
    init(presenter: AddNotePresenterProtocol) {
        self.presenter = presenter
    }

}

extension AddNoteInteractor: AddNoteInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
}
