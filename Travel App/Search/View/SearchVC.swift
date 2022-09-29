//
//  searchVC.swift
//  Travel App
//
//  Created by Berkay on 28.09.2022.
//

import UIKit

class SearchVC: UIViewController {

    let searchController = UISearchController()
    @IBOutlet weak var noDataImageView: UIImageView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        noDataLabel.isHidden = true
        noDataImageView.isHidden = true
    }
}

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
