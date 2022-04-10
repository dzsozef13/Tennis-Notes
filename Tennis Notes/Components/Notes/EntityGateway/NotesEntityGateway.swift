//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class NotesEntityGateway {
    weak var interactor: NotesInteractorProtocol?

    init(interactor: NotesInteractorProtocol) {
        self.interactor = interactor
    }
}

extension NotesEntityGateway: NotesEntityGatewayProtocol {
    
}
