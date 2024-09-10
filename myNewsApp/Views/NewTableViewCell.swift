//
//  NewTableViewCell.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 10.09.2024.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    static let cell = "newCell"
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
