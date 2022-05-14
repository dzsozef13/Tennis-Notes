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
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(error: ErrorNote) {
        titleLabel?.text = error.title
        contentLabel?.text = error.note
        dateLabel?.text = error.date?.formatted()
    }
}
