//
//  TableSelector.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 10..
//

import Foundation
import UIKit

class TableSelector: PressableView {
    
    // MARK: Static parameters
    // Background colors
    static let normalColor: UIColor = Assets.Colors.backgroundTertiary.color
    static let activeColor: UIColor = Assets.Colors.accentColor.color
    // Title label colors
    static let normalTitleColor: UIColor = Assets.Colors.backgroundQuaternary.color
    static let activeTitleColor: UIColor = Assets.Colors.textDarkPrimary.color
    // Title font size
    static let fontSize: CGFloat = 18
    static let animationLenght: CGFloat = 0
    
    // MARK: Interface Builder Outlets
    @IBOutlet weak var titleLabel: UILabel?
    
    // MARK: Setup Title
    public func setTitleLabel(for title: String) {
        guard let label = titleLabel else { return }
        // Set label attributes
        label.center = self.center
        label.font = .boldSystemFont(ofSize: TableSelector.fontSize)
        label.textAlignment = .center
        label.text = title
        // Add label to superview
        self.addSubview(label)
    }
    
    // MARK: Selection Indicator
    // Selected
    func activateSelector() {
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundColor = TableSelector.activeColor
            self.titleLabel?.textColor = TableSelector.activeTitleColor
        }, completion: nil)
        
    }
    // Deselected
    func deactivateSelector() {
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundColor = TableSelector.normalColor
            self.titleLabel?.textColor = TableSelector.normalTitleColor
        }, completion: nil)
    }
}
