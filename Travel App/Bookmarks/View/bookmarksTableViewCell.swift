//
//  bookmarksTableViewCell.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class bookmarksTableViewCell: UITableViewCell {

    @IBOutlet weak var bookmarksImageView: UIImageView!
    @IBOutlet weak var bookmarksDescLabel: UILabel!
    @IBOutlet weak var bookmarksTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookmarksImageView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
