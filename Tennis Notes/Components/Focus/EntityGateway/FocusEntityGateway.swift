//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation
import CoreData

class FocusEntityGateway {
    weak var interactor: FocusInteractorProtocol?
    weak var storage: AppStorage?

    init(interactor: FocusInteractorProtocol) {
        self.interactor = interactor
        self.storage = AppStorage.shared
    }
}

extension FocusEntityGateway: FocusEntityGatewayProtocol {
    func fetchTargetNotes() -> [TargetNote] {
        return storage?.fetchItems(item: .target) as! [TargetNote]
    }
    
    func fetchErrorNotes() -> [ErrorNote] {
        return storage?.fetchItems(item: .error) as! [ErrorNote]
    }
}
