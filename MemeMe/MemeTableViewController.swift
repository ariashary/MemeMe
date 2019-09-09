//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Muhammad Ashary on 09/09/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    var rowSelected : Int?
    
    // MARK: Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MemeTableViewCell

        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.memeTitle?.text = meme.topText + " " + meme.bottomText
        cell.memeTopText?.text = meme.topText
        cell.memeBottomText?.text = meme.bottomText
        cell.memeImage?.image = meme.memedImage
        
        return cell
    }
    
    // MARK: Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = (indexPath as NSIndexPath).row
        
        performSegue(withIdentifier: "memeTableDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memeTableDetail" {
            
            if let vc =  segue.destination as? MemeDetailViewController {
                vc.rowSelected = rowSelected
            }
        }
    }
 
}
