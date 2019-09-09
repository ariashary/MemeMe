//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Muhammad Ashary on 09/09/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    var rowSelected : Int?
    
    @IBOutlet var detailImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailImage.image = memes?[rowSelected!].memedImage
    }


}
