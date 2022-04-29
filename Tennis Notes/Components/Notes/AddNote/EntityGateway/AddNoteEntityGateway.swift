//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class AddNoteEntityGateway {
    weak var interactor: AddNoteInteractorProtocol?

    init(interactor: AddNoteInteractorProtocol) {
        self.interactor = interactor
    }
}

extension AddNoteEntityGateway: AddNoteEntityGatewayProtocol {
    
}
