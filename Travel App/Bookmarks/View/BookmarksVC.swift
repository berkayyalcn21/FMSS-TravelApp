//
//  BookmarksVC.swift
//  Travel App
//
//  Created by Berkay on 28.09.2022.
//

import UIKit

class BookmarksVC: UIViewController {

    @IBOutlet weak var bookmarksTableView: UITableView!
    let bookmarksVM = BookmarksVM()
    private let bookmarksRegisterKey = "bookmarksTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = bookmarksVM.didViewLoad()
        bookmarksTableView.reloadData()
    }
    
    func setupUI() {
        bookmarksTableView.delegate = self
        bookmarksTableView.dataSource = self
        register()
    }
    
    func register() {
        bookmarksTableView.register(.init(nibName: bookmarksRegisterKey, bundle: nil), forCellReuseIdentifier: bookmarksRegisterKey)
    }
}

extension BookmarksVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bookmarksTableView.deselectRow(at: indexPath, animated: false)
        let cellModel = bookmarksVM.didViewLoad()[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.data = cellModel as AnyObject
        detailVC.dataType = .bookmark
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension BookmarksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarksVM.didViewLoad().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmarks = bookmarksVM.didViewLoad()[indexPath.row]
        let cell = bookmarksTableView.dequeueReusableCell(withIdentifier: bookmarksRegisterKey, for: indexPath) as! bookmarksTableViewCell
        cell.bookmarksImageView.image = UIImage(data: bookmarks.bookmarkImageView!)
        cell.bookmarksTitleLabel.text = bookmarks.bookmarkTitle
        cell.bookmarksDescLabel.text = bookmarks.bookmarkDesc
        cell.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
//        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
