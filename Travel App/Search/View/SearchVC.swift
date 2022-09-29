//
//  searchVC.swift
//  Travel App
//
//  Created by Berkay on 28.09.2022.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var noDataImageView: UIImageView!
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var hotelLine: UIView!
    @IBOutlet weak var flightLine: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        noDataLabel.isHidden = true
        noDataImageView.isHidden = true
    }
    
    @IBAction func hotelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func flightButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    
}

