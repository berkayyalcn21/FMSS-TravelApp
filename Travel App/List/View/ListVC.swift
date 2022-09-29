//
//  ListVC.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var listTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
