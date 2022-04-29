//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation
import CoreData

class AddFocusInteractor {
    weak var presenter: AddFocusPresenterProtocol?
    lazy var entityGateway: AddFocusEntityGatewayProtocol = AddFocusEntityGateway(interactor: self)
    weak var storage: AppStorage?
    
    // Type of
    var objectType: ManagedContextObject?
    
    init(presenter: AddFocusPresenterProtocol) {
        self.presenter = presenter
        self.storage = AppStorage.shared
        
        // Check object type based on the selected table in Focus view
        guard let selectedFocusTable: String = UserDefaults.standard.object(forKey: "SelectedFocusTable") as? Shortcut.RawValue else {
            self.objectType = .target
            return
        }
        if selectedFocusTable == Shortcut.targets.rawValue {
            self.objectType = .target
        }
        if selectedFocusTable == Shortcut.errors.rawValue {
            self.objectType = .error
        }
    }
}

extension AddFocusInteractor: AddFocusInteractorProtocol {
    
    // MARK: In
    
    // MARK: Out
    func createNote(title: String?, content: String?) {
        switch self.objectType {
        case .target:
            storage?.createTargetNote(title: title, content: content)
        case .error:
            storage?.createErrorNote(title: title, content: content)
        default:
            return
        }
    }
}
