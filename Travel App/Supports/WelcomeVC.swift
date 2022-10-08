//
//  WelcomeVC.swift
//  Travel App
//
//  Created by Berkay on 8.10.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First screen gif settings
        let gif = UIImage.gifImageWithName("fly")
        imageView.image = gif
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let story = self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(story, animated: false)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
