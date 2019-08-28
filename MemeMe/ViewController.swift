//
//  ViewController.swift
//  MemeMe
//
//  Created by Muhammad Ashary on 28/08/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imagePickerView: UIImageView!
    @IBOutlet var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func pickAnImageFromAlbum(_ sender: UIBarButtonItem) {
        let Imagepicker = UIImagePickerController()
        Imagepicker.delegate = self
        Imagepicker.sourceType = .photoLibrary
        present(Imagepicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let Imagepicker = UIImagePickerController()
        Imagepicker.delegate = self
        Imagepicker.sourceType = .camera
        present(Imagepicker, animated: true, completion: nil)
    }
    

}

