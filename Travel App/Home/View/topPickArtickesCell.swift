//
//  topPickArtickesCell.swift
//  Travel App
//
//  Created by Berkay on 27.09.2022.
//

import UIKit

protocol ArticleSaveButtonProtocol {
    func articleSaveOrDelete(indexPaht: IndexPath)
}

class topPickArtickesCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var articleButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var articleButtonDelegate: ArticleSaveButtonProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func articleSaveButton(_ sender: Any) {
        if let indexPath {
            articleButtonDelegate?.articleSaveOrDelete(indexPaht: indexPath)
        }
    }
}
