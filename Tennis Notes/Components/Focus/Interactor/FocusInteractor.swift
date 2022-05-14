//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation

class FocusInteractor {
    
    weak var presenter: FocusPresenterProtocol?
    lazy var entityGateway: FocusEntityGatewayProtocol = FocusEntityGateway(interactor: self)
    
    init(presenter: FocusPresenterProtocol) {
        self.presenter = presenter
        
        // MARK: Initialize Notification Listeners
        // Created new target note
        notificationCenter.addObserver(self, selector: #selector(didAddTargetNote), name: Notification.AddedTargetNote.notificationName(), object: nil)
        // Created new error note
        notificationCenter.addObserver(self, selector: #selector(didAddErrorNote), name: Notification.AddedErrorNote.notificationName(), object: nil)
    }
    
    // MARK: Notifications
    let notificationCenter = NotificationCenter.default

}

extension FocusInteractor: FocusInteractorProtocol {
    
    // MARK: In
    func fetchTargetNotes() -> [TargetNote] {
        entityGateway.fetchTargetNotes()
    }
    
    func fetchErrorNotes() -> [ErrorNote] {
        entityGateway.fetchErrorNotes()
    }
    
    @objc func didAddTargetNote() {
        presenter?.presentTargetNotes()
    }
    
    @objc func didAddErrorNote() {
        presenter?.presentErrorNotes()
    }
    
    // MARK: Out
}
