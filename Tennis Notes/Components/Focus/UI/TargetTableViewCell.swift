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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(target: TargetNote) {
        titleLabel?.text = target.title
        contentLabel?.text = target.note
        dateLabel?.text = target.date?.formatted()
    }
}

