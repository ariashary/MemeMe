//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Muhammad Ashary on 09/09/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    var rowSelected : Int?
    
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    func setupFlowLayout(orientation: UIDeviceOrientation) -> Void {
        let space: CGFloat = 3.0
        let dimension: CGFloat
        
        if orientation == .portrait {
            dimension = (view.frame.size.width - (2 * space)) / 3.0
        } else if orientation == .portraitUpsideDown {
            dimension = (view.frame.size.width - (2 * space)) / 3.0
        } else {
            dimension = (view.frame.size.height - (2 * space)) / 3.0
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    /*
    func subscribeToOrientationNotification() -> Void {
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(deviceDidRotate(_:)), name: NSNotification.Name.UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func deviceDidRotate(_ notification: NSNotification) -> Void {
        
        switch UIDevice.current.orientation {
        case .landscapeRight:
            setupFlowLayout(orientation: .landscapeRight)
        case .landscapeLeft:
            setupFlowLayout(orientation: .landscapeLeft)
        default:
            setupFlowLayout(orientation: .portrait)
        }
    }
    */
    
    // MARK: Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFlowLayout(orientation: UIDevice.current.orientation)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
        
        //subscribeToOrientationNotification()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MemeCollectionViewCell
    
        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.memeImage?.image = meme.memedImage
    
        return cell
    }
    
    // MARK: Navigation
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rowSelected = (indexPath as NSIndexPath).row
        
        performSegue(withIdentifier: "memeCollectionDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memeCollectionDetail" {
            
            if let vc =  segue.destination as? MemeDetailViewController {
                vc.rowSelected = rowSelected
            }
        }
    }

}
