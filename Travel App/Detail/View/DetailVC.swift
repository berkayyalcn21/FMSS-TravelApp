//
//  DetailVC.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class DetailVC: UIViewController {

    let descText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    var data: AnyObject?
    var dataType: DataType?
    var detailViewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    enum DataType {
        case article
        case flight
        case hotel
        case bookmark
    }
    
    func setupUI() {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 32
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        switch dataType {
        case .article:
            if let data = data as? Article {
                if let url = data.images {
                    DispatchQueue.main.async {
                        self.imageView.kf.setImage(with: URL(string: url))
                    }
                }
                categoryLabel.text = data.category
                titleLabel.text = data.title
                descLabel.text = data.description
            }
        case .flight:
            if let data = data as? ListEntity {
                imageView.image = UIImage(named: "bg-8-1")
                categoryLabel.text = "Travel"
                titleLabel.text = data.listTitle
                descLabel.text = descText
            }
        case .hotel:
            if let data = data as? ListEntity {
                imageView.image = UIImage(named: "bg-6")
                categoryLabel.text = "Travel"
                titleLabel.text = data.listTitle
                descLabel.text = descText
            }
        case .bookmark:
            if let data = data as? BookmarksEntity {
                imageView.image = UIImage(data: data.bookmarkImageView!)
                categoryLabel.text = "Travel"
                titleLabel.text = data.bookmarkTitle
                descLabel.text = data.bookmarkDesc
            }
        case .none: break
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addBookmarkButtonTapped(_ sender: Any) {
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        detailViewModel.sendDataPost(bookmarkImageView: imageData!, bookmarkTitle: titleLabel.text!, bookmarkDesc: descLabel.text!)
    }
    
}
