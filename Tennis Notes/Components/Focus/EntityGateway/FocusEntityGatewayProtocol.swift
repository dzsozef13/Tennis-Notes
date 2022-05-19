//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol FocusEntityGatewayProtocol {
    func fetchTargetNotes() -> [TargetNote]
    func fetchErrorNotes() -> [ErrorNote]
    
    func deleteTargetNote(note: TargetNote)
    func deleteErrorNote(note: ErrorNote)
    
    func toggleTargetNote(note: TargetNote)
    func toggleErrorNote(note: ErrorNote)
}
