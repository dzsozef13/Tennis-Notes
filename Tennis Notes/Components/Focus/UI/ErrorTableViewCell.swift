//
//  ErrorTableViewCell.swift
//  Tennis Notes
//
//  Created by Punk József on 2022. 04. 15..
//

import UIKit

class ErrorTableViewCell: UITableViewCell {
    
    // MARK: Reuseable Cell Identifier
    static let identifier: String = "ErrorTableViewCell"
    
    // MARK: IBO Outlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var correctedLabel: UILabel?
    @IBOutlet weak var correctedImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK: Styling
        self.cellView?.layer.cornerRadius = TableViewCell().cornerRadius()
    }
    
    func setupView(error: ErrorNote) {
        titleLabel?.text = error.title
        contentLabel?.text = error.note
        dateLabel?.text = error.date?.string(with: .DMY)
        
        if error.corrected == true {
            correctedLabel?.textColor = Assets.Colors.accentColor.color
            correctedImage?.tintColor = Assets.Colors.accentColor.color
            correctedImage?.image = UIImage(systemName: "checkmark.circle")
        } else {
            correctedLabel?.textColor = Assets.Colors.textDarkTertiary.color
            correctedImage?.tintColor = Assets.Colors.textDarkTertiary.color
            correctedImage?.image = UIImage(systemName: "circle")
        }
    }
}
