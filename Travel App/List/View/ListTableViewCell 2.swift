//
//  ListTableViewCell.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ListTitleLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var ListImageView: UIImageView!
    @IBOutlet weak var ListDescLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ListImageView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
