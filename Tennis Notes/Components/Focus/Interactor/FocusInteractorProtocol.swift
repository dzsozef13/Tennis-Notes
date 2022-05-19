//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol FocusInteractorProtocol: AnyObject {

    // MARK: In
    func fetchTargetNotes() -> [TargetNote]
    func fetchErrorNotes() -> [ErrorNote]
    
    func didAddTargetNote()
    func didAddErrorNote()

    // MARK: Out
    func didDeleteTargetNote(note: TargetNote)
    func didDeleteErrorNote(note: ErrorNote)
    
    func didToggleTargetNote(note: TargetNote)
    func didToggleErrorNote(note: ErrorNote)
    
}
