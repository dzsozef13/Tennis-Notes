//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class NotesInteractor {
    
    weak var presenter: NotesPresenterProtocol?
    lazy var entityGateway: NotesEntityGatewayProtocol = NotesEntityGateway(interactor: self)
    
    init(presenter: NotesPresenterProtocol) {
        self.presenter = presenter
    }

}

extension NotesInteractor: NotesInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
}
