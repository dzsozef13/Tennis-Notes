//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation
import UIKit

protocol AddFocusEventHandlerProtocol {
    func prepare(for segue: UIStoryboardSegue)
    
    func didLoad()
    func willAppear()
    func traitCollectionDidChange()
    
    func didTapDone()
    func didTapCancel()
    func didTapAdd(title: String?, content: String?)
}
