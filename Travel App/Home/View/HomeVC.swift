//
//  ViewController.swift
//  Travel App
//
//  Created by Berkay on 27.09.2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var topArticlesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {

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


