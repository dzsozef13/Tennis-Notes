//
//  PressableView.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 11..
//

import UIKit

class PressableView: UIView {
    
    // MARK: Static Values
    static let animationLength = 0.05
    static let scaleAnimationValue: CGFloat = 0.98
    static let dimAlphaValue: CGFloat = 0.9
    
    // MARK: Lifecycle Methods
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pressAnimation()
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        releaseAnimation()
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        releaseAnimation()
    }
    
    // MARK: Animations
    func pressAnimation() {
        self.isUserInteractionEnabled = false
        DispatchQueue.main.async {
            UIView.animate(withDuration: PressableView.animationLength, animations: {
                self.transform = CGAffineTransform(scaleX: PressableView.scaleAnimationValue, y: PressableView.scaleAnimationValue)
                self.alpha = PressableView.dimAlphaValue
            })
        }
    }

    func releaseAnimation() {
        let delay = PressableView.animationLength
        DispatchQueue.main.async {
            UIView.animate(withDuration: PressableView.animationLength, delay: delay, animations: {
                self.transform = .identity
                self.alpha = 1
            }, completion: { finished in
                self.isUserInteractionEnabled = true
            })
        }
    }
}
