//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

protocol FocusEntityGatewayProtocol {
    func fetchTargetNotes() -> [TargetNote]
    func fetchErrorNotes() -> [ErrorNote]
}
