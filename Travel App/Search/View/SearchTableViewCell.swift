//
//  SearchTableViewCell.swift
//  Travel App
//
//  Created by Berkay on 28.09.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchDescLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchImageView.layer.cornerRadius = 6
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
