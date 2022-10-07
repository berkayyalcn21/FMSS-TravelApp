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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchImageView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
