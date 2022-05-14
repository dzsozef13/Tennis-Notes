//
//  DimView.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 05. 13..
//

import Foundation
import UIKit

class DimView {
    
    static let fadeManager = DimView()
    
    // MARK: Show
    func fadeOut(fade: Bool, in view: UIView, completionHandler: (() -> Void)?) {
        
        let dimView = UIView(frame: UIScreen.main.bounds)
        dimView.backgroundColor = Assets.Colors.backgroundPrimary.color
        dimView.alpha = 0
        view.addSubview(dimView)
        
        if fade {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                dimView.alpha = 1
            } completion: { _ in
                dimView.removeFromSuperview()
                completionHandler?()
            }
        } else {
            dimView.alpha = 1
        }
    }
    
    // MARK: Hide
    func fadeIn(fade: Bool, in view: UIView, completionHandler: (() -> Void)?) {
        
        let dimView = UIView(frame: UIScreen.main.bounds)
        dimView.backgroundColor = Assets.Colors.backgroundPrimary.color
        dimView.alpha = 1
        view.addSubview(dimView)
        
        if fade {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                dimView.alpha = 0
            } completion: { _ in
                dimView.removeFromSuperview()
                completionHandler?()
            }
        } else {
            dimView.alpha = 0
        }
    }
    
}
