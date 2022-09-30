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
    @IBOutlet weak var hotelButton: UIButton!
    @IBOutlet weak var flightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        noDataLabel.isHidden = true
        noDataImageView.isHidden = true
        flightLine.isHidden = true
    }
    
    @IBAction func hotelButtonTapped(_ sender: Any) {
        hotelLine.isHidden = false
        flightLine.isHidden = true
        hotelButton.setTitleColor(UIColor(named: "selectedButtonColor"), for: .normal)
        flightButton.setTitleColor(UIColor(named: "defaultButtonColor"), for: .normal)
        hotelButton.setImage(UIImage(named: "searchHotelIconFill"), for: .normal)
        flightButton.setImage(UIImage(named: "searchFlightIcon"), for: .normal)
    }
    
    @IBAction func flightButtonTapped(_ sender: Any) {
        hotelLine.isHidden = true
        flightLine.isHidden = false
        hotelButton.setTitleColor(UIColor(named: "defaultButtonColor"), for: .normal)
        flightButton.setTitleColor(UIColor(named: "selectedButtonColor"), for: .normal)
        hotelButton.setImage(UIImage(named: "searchHotelIcon"), for: .normal)
        flightButton.setImage(UIImage(named: "searchFlightIconFill"), for: .normal)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    
}

