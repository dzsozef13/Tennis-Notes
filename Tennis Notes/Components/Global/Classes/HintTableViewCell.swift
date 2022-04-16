//
//  HintTableViewCell.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 15..
//

import UIKit

class HintTableViewCell: PressableTableViewCell {

    // Reuseable Cell Identifier
    static let identifier: String = "HintTableViewCell"
    
    // IBO Outlets
    @IBOutlet weak var hintIcon: UIImageView?
    @IBOutlet weak var hintTitle: UILabel?
    @IBOutlet weak var hintMessage: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(icon: UIImage, title: String, message: String) {
        self.hintIcon?.image = icon
        self.hintTitle?.text = title
        self.hintMessage?.text = message
    }
}
