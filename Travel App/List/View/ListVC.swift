//
//  ListVC.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var listActivity: UIActivityIndicatorView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var listTitleLabel: UILabel!
    private let listTableViewId = "ListTableViewCell"
    let viewModel = ListVM()
    var topTitle: String = ""
    var whitchButton: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        listTitleLabel.text = topTitle
    }
    
    func setupUI() {
        register()
        listTableView.delegate = self
        listTableView.dataSource = self
        viewModel.listVMDelegate = self
        if whitchButton == "hotel" {
            viewModel.hotelOrFlight = .hotel
        }else {
            viewModel.hotelOrFlight = .flight
        }
        viewModel.didViewLoad()
    }
    
    func register() {
        listTableView.register(.init(nibName: listTableViewId, bundle: nil), forCellReuseIdentifier: listTableViewId)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = viewModel.getModel(at: indexPath.row)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.data = cellModel as AnyObject
        if whitchButton == "hotel" {
            detailVC.dataType = .hotel
        }else {
            detailVC.dataType = .flight
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.getModel(at: indexPath.row)
        self.listActivity.stopAnimating()
        let cell = listTableView.dequeueReusableCell(withIdentifier: listTableViewId, for: indexPath) as! ListTableViewCell
        if whitchButton == "hotel" {
            cell.ListImageView.image = UIImage(named: "bg-7")
        }else {
            cell.ListImageView.image = UIImage(named: "bg-8")
        }
        cell.ListTitleLabel.text = cellModel.listTitle
        cell.ListDescLabel.text = cellModel.listDesc
        cell.layer.cornerRadius = 20
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ListVC: ListVMToListVCProtocol {
    func sendDataIsFinish(_ isSuccess: Bool) {
        if isSuccess {
            DispatchQueue.main.async { [weak self] in
                self?.listTableView.reloadData()
            }
        }
    }
}
