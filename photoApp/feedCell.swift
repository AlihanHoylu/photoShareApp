//
//  feedCell.swift
//  photoApp
//
//  Created by Alihan Hoylu on 6.09.2023.
//

import UIKit

class feedCell: UITableViewCell {
    
    
    @IBOutlet weak var descpTextLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var emailTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
