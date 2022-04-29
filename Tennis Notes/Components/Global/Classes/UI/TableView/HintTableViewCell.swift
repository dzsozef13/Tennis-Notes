//
//  HintTableViewCell.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 15..
//

import UIKit

class HintTableViewCell: PressableTableViewCell {

    // MARK: Reuseable Cell Identifier
    static let identifier: String = "HintTableViewCell"
    
    // MARK: IBO Outlets
    @IBOutlet weak var hintIcon: UIImageView?
    @IBOutlet weak var hintTitle: UILabel?
    @IBOutlet weak var hintMessage: UILabel?
    @IBOutlet weak var cellView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK: Styling
        self.cellView?.layer.cornerRadius = TableViewCell().cornerRadius()
    }
    
    // MARK: Setup
    func setupView(icon: UIImage, title: String, message: String) {
        self.hintIcon?.image = icon
        self.hintTitle?.text = title
        self.hintMessage?.text = message
    }
}
