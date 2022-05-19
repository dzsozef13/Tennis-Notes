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
    
    func deleteTargetNote(note: TargetNote) {
        storage?.deleteTargetNote(note: note)
    }
    
    func deleteErrorNote(note: ErrorNote) {
        storage?.deleteErrorNote(note: note)
    }
    
    func toggleTargetNote(note: TargetNote) {
        storage?.toggleTargetNote(note: note)
    }
    
    func toggleErrorNote(note: ErrorNote) {
        storage?.toggleErrorNote(note: note)
    }
}
