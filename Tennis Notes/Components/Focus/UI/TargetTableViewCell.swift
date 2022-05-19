//
//  TargetTableViewCell.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 15..
//

import UIKit

class TargetTableViewCell: UITableViewCell {
    
    // MARK: Reuseable Cell Identifier
    static let identifier: String = "TargetTableViewCell"
    
    // MARK: IBO Outlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var achivedLabel: UILabel?
    @IBOutlet weak var achivedImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(target: TargetNote) {
        titleLabel?.text = target.title
        contentLabel?.text = target.note
        dateLabel?.text = target.date?.formatted()
        
        if target.achieved == true {
            achivedLabel?.textColor = Assets.Colors.accentColor.color
            achivedImage?.tintColor = Assets.Colors.accentColor.color
            achivedImage?.image = UIImage(systemName: "checkmark.circle")
        } else {
            achivedLabel?.textColor = Assets.Colors.textDarkTertiary.color
            achivedImage?.tintColor = Assets.Colors.textDarkTertiary.color
            achivedImage?.image = UIImage(systemName: "circle")
        }
    }
}

