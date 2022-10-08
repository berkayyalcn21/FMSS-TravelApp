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
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookmarksImageView.layer.cornerRadius = 6
        bgView.layer.cornerRadius = 6
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOffset = CGSize(width: 0, height: 5)
        bgView.layer.shadowRadius = 5
        bgView.layer.shadowOpacity = 0.2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
