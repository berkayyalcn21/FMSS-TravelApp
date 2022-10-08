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
        myView.layer.cornerRadius = 6
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOffset = CGSize(width: 0, height: 5)
        myView.layer.shadowRadius = 5
        myView.layer.shadowOpacity = 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
