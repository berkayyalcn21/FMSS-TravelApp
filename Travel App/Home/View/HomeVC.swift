//
//  ViewController.swift
//  Travel App
//
//  Created by Berkay on 27.09.2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var topArticlesCollectionView: UICollectionView!
    private let topAriclesCollection = "topPickArtickesCell"
    private let homeVM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        homeVM.viewModelDelegate = self
        homeVM.didViewLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupUI() {
        topArticlesCollectionView.delegate = self
        topArticlesCollectionView.dataSource = self
        register()
    }
    
    func register() {
        topArticlesCollectionView.register(.init(nibName: topAriclesCollection, bundle: nil), forCellWithReuseIdentifier: topAriclesCollection)
    }

    @IBAction func flightButtonTapped(_ sender: Any) {
        let flightVC = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        navigationController?.pushViewController(flightVC, animated: true)
    }
    
    @IBAction func hotelButtonTapped(_ sender: Any) {
        let hotelVC = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        navigationController?.pushViewController(hotelVC, animated: true)
    }
    
}

extension HomeVC: UICollectionViewDelegate {
    
}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = homeVM.getModel(at: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topAriclesCollection, for: indexPath) as! topPickArtickesCell
        if let url = cellModel.images {
            DispatchQueue.global().async {
                let data = try! Data(contentsOf: URL(string: url)!)
                DispatchQueue.main.async {
                    cell.imageView.image = UIImage(data: data)
                }
            }
        }
        cell.categoryLabel.text = cellModel.category
        cell.titleLabel.text = cellModel.title
        return cell
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
