//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation
import UIKit

protocol FocusEventHandlerProtocol {
    func prepare(for segue: UIStoryboardSegue)
    
    func didLoad()
    func willAppear()
    func traitCollectionDidChange()
    
    func didTapSelectorTargets()
    func didTapSelectorErrors()

    func didDeleteTargetNote(note: TargetNote)
    func didDeleteErrorNote(note: ErrorNote)
    
    func didToggleTargetNote(note: TargetNote)
    func didToggleErrorNote(note: ErrorNote)
}
