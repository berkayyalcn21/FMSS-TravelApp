//
//  ViewController.swift
//  Travel App
//
//  Created by Berkay on 27.09.2022.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {

    @IBOutlet weak var topArticlesCollectionView: UICollectionView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var flightView: UIView!
    @IBOutlet weak var hotelView: UIView!
    private let topAriclesCollection = "topPickArtickesCell"
    private let homeVM = HomeVM()
    let bookmarksVM = BookmarksVM()
    var detailViewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        homeVM.viewModelDelegate = self
        homeVM.didViewLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        topArticlesCollectionView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupUI() {
        topArticlesCollectionView.delegate = self
        topArticlesCollectionView.dataSource = self
        
        register()
        
        flightView.layer.shadowColor = UIColor.white.cgColor
        flightView.layer.shadowOffset = .zero
        flightView.layer.shadowRadius = 5
        flightView.layer.shadowOpacity = 0.4
        
        hotelView.layer.shadowColor = UIColor.white.cgColor
        hotelView.layer.shadowOffset = .zero
        hotelView.layer.shadowRadius = 5
        hotelView.layer.shadowOpacity = 0.4
    }
    
    func register() {
        topArticlesCollectionView.register(.init(nibName: topAriclesCollection, bundle: nil), forCellWithReuseIdentifier: topAriclesCollection)
    }

    @IBAction func flightButtonTapped(_ sender: Any) {
        let flightVC = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        flightVC.whitchButton = "flight"
        flightVC.topTitle = "Flight"
        navigationController?.pushViewController(flightVC, animated: true)
    }
    
    @IBAction func hotelButtonTapped(_ sender: Any) {
        let hotelVC = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        hotelVC.whitchButton = "hotel"
        hotelVC.topTitle = "Hotel"
        navigationController?.pushViewController(hotelVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellModel = homeVM.getModel(at: indexPath.row)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.data = cellModel as AnyObject
        detailVC.dataType = .article
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDataSource, ArticleSaveButtonProtocol {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = homeVM.getModel(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topAriclesCollection, for: indexPath) as! topPickArtickesCell
        if let url = cellModel.images {
            DispatchQueue.main.async {
                cell.imageView.kf.setImage(with: URL(string: url))
            }
        }
        cell.categoryLabel.text = cellModel.category
        cell.titleLabel.text = cellModel.title
        cell.articleButtonDelegate = self
        cell.indexPath = indexPath
        cell.articleButton.setImage(UIImage(named: "bookmarkSave"), for: .normal)
        for i in bookmarksVM.didViewLoad() {
            if i.bookmarkTitle == cellModel.title {
                cell.articleButton.setImage(UIImage(named: "bookmarkSaveFill"), for: .normal)
            }
        }
        return cell
    }
    
    func articleSaveOrDelete(indexPaht: IndexPath) {
        let cellArticleModel = homeVM.getModelList()[indexPaht.row]
        if !bookmarksVM.didViewLoad().isEmpty {
            for i in bookmarksVM.didViewLoad() {
                if i.bookmarkTitle == cellArticleModel.title {
                    articleSaveOrDelete(check: false, indexPaht: indexPaht)
                    break
                }else {
                    self.articleSaveOrDelete(check: true, indexPaht: indexPaht)
                    print("sildi")
                    break
                }
            }
        }else {
            articleSaveOrDelete(check: true, indexPaht: indexPaht)
        }
    }
    
    func articleSaveOrDelete(check: Bool, indexPaht: IndexPath) {
        let cellArticleModel = homeVM.getModelList()[indexPaht.row]
        if !check {
            detailViewModel.sendDataDelete(name: cellArticleModel.title!)
        }else {
            DispatchQueue.global(qos: .userInitiated).async {
                if let url = cellArticleModel.images {
                    let data = try! Data(contentsOf: URL(string: url)!)
                    guard let image = UIImage(data: data) else { return }
                    let imageData = image.jpegData(compressionQuality: 0.5)
                    self.detailViewModel.sendDataPost(bookmarkImageView: imageData!,
                                                      bookmarkTitle: cellArticleModel.title!,
                                                      bookmarkDesc: cellArticleModel.description!)
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.topArticlesCollectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 253, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

extension HomeVC: HomeVMToHomeVCProtocol {
    
    func sendDataIsFinish(_ isSuccess: Bool) {
        if isSuccess {
            DispatchQueue.main.async {
                self.topArticlesCollectionView.reloadData()
            }
        }
    }
}
