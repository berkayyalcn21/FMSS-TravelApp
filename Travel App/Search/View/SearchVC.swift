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
    private let searchTableViewRegister = "SearchTableViewCell"
    let searcViewModel = SearchVM()
    var filteredModelList = [ListEntity]()
    var whitchButton: Buttons?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        searcViewModel.searchButtons = .hotel
        whitchButton = .hotel
        searcViewModel.didViewLoad()
    }
    
    func setupUI() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        noDataLabel.isHidden = true
        noDataImageView.isHidden = true
        flightLine.isHidden = true
        register()
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .editingChanged)
    }
    
    func register() {
        searchTableView.register(.init(nibName: searchTableViewRegister, bundle: nil), forCellReuseIdentifier: searchTableViewRegister)
    }
    
    enum Buttons {
        case hotel
        case flight
    }
    
    @IBAction func hotelButtonTapped(_ sender: Any) {
        changeButtonColor(true)
        whitchButton = .hotel
        filteredModelList.removeAll()
        searchTextField.text = ""
        searcViewModel.searchButtons = .hotel
        searcViewModel.didViewLoad()
        searchTableView.reloadData()
    }
    
    @IBAction func flightButtonTapped(_ sender: Any) {
        changeButtonColor(false)
        whitchButton = .flight
        filteredModelList.removeAll()
        searchTextField.text = ""
        searcViewModel.searchButtons = .flight
        searcViewModel.didViewLoad()
        searchTableView.reloadData()
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    @objc func searchTextFieldDidChange() {
        guard let text = searchTextField.text else { return }
        let modelList = searcViewModel.getModel()
        if text.count > 2 && text.count != 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else { return }
                self.filteredModelList = modelList.filter( { $0.listTitle!.lowercased().contains(text.lowercased()) })
                if self.filteredModelList.count < 1 {
                    self.noDataLabel.isHidden = false
                    self.noDataImageView.isHidden = false
                    self.searchTableView.isHidden = true
                }else {
                    self.noDataLabel.isHidden = true
                    self.noDataImageView.isHidden = true
                    self.searchTableView.isHidden = false
                }
                self.searchTableView.reloadData()
            }
        }else {
            self.noDataLabel.isHidden = true
            self.noDataImageView.isHidden = true
            self.searchTableView.isHidden = false
            filteredModelList.removeAll()
            searchTableView.reloadData()
        }
    }
    
    func changeButtonColor(_ isChange: Bool) {
        if isChange {
            hotelLine.isHidden = false
            flightLine.isHidden = true
            hotelButton.setTitleColor(UIColor(named: "selectedButtonColor"), for: .normal)
            flightButton.setTitleColor(UIColor(named: "defaultButtonColor"), for: .normal)
            hotelButton.setImage(UIImage(named: "searchHotelIconFill"), for: .normal)
            flightButton.setImage(UIImage(named: "searchFlightIcon"), for: .normal)
        }else {
            hotelLine.isHidden = true
            flightLine.isHidden = false
            hotelButton.setTitleColor(UIColor(named: "defaultButtonColor"), for: .normal)
            flightButton.setTitleColor(UIColor(named: "selectedButtonColor"), for: .normal)
            hotelButton.setImage(UIImage(named: "searchHotelIcon"), for: .normal)
            flightButton.setImage(UIImage(named: "searchFlightIconFill"), for: .normal)
        }
    }
    
    
}

extension SearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = filteredModelList[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.data = cellModel as AnyObject
        if whitchButton == .hotel {
            detailVC.dataType = .hotel
        }else {
            detailVC.dataType = .flight
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension SearchVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = filteredModelList[indexPath.row]
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchTableViewRegister, for: indexPath) as! SearchTableViewCell
        if whitchButton == .hotel {
            cell.searchImageView.image = UIImage(named: "bg-7")
            cell.typeImageView.image = UIImage(named: "hotel")
        }else {
            cell.searchImageView.image = UIImage(named: "bg-8")
            cell.typeImageView.image = UIImage(named: "flight")
        }
        cell.searchTitleLabel.text = cellModel.listTitle
        cell.searchDescLabel.text = cellModel.listDesc
        cell.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
