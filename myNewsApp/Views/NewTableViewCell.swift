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
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setImage(urlString: String?) {
        newsImage.image = nil

        if let imageUrlString = urlString, let imageUrl = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: imageData)
                    }
                }
            }.resume()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
