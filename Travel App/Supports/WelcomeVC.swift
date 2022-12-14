//
//  WelcomeVC.swift
//  Travel App
//
//  Created by Berkay on 8.10.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let searcViewModel = SearchVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searcViewModel.searchButtons = .hotel
        searcViewModel.didViewLoad()
        // First screen gif settings
        let gif = UIImage.gifImageWithName("fly")
        imageView.image = gif
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let story = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as! TabBarVC
            self.navigationController?.pushViewController(story, animated: false)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
