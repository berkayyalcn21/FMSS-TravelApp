//
//  DetailVC.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var descLabel: UITextView!
    var data: AnyObject?
    var dataType: DataType?
    var detailViewModel = DetailVM()
    let bookmarksVM = BookmarksVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeButtonTitle()
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
                categoryLabel.text = "Flight Travel"
                titleLabel.text = data.listTitle
                descLabel.text = detailViewModel.descText()
            }
        case .hotel:
            if let data = data as? ListEntity {
                imageView.image = UIImage(named: "bg-6")
                categoryLabel.text = "Hotel Travel"
                titleLabel.text = data.listTitle
                descLabel.text = detailViewModel.descText()
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
        var checkDetailButtonControl = true
        if !bookmarksVM.didViewLoad().isEmpty {
            for i in bookmarksVM.didViewLoad() {
                if i.bookmarkTitle == titleLabel.text {
                    detailViewModel.sendDataDelete(name: titleLabel.text!)
                    checkDetailButtonControl = false
                }
            }
            if checkDetailButtonControl {
                let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
                detailViewModel.sendDataPost(bookmarkImageView: imageData!, bookmarkTitle: titleLabel.text!, bookmarkDesc: descLabel.text!)
            }
        }else {
            let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
            detailViewModel.sendDataPost(bookmarkImageView: imageData!, bookmarkTitle: titleLabel.text!, bookmarkDesc: descLabel.text!)
        }
        changeButtonTitle()
    }
    
    func changeButtonTitle() {
        detailButton.setTitle("Add Bookmark", for: .normal)
        for i in bookmarksVM.didViewLoad() {
            if i.bookmarkTitle == titleLabel.text {
                detailButton.setTitle("Remove Bookmark", for: .normal)
            }
        }
    }
}
