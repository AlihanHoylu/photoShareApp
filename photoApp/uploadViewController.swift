//
//  uploadViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit

class uploadViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    
    @IBOutlet weak var peekPhoto: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var descpTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.isEnabled = false

        peekPhoto.isUserInteractionEnabled = true
        let gestru = UITapGestureRecognizer(target: self, action: #selector(gestruge))
        peekPhoto.addGestureRecognizer(gestru)
        
    }
    
    @objc func gestruge(){
        
        let viewAlbume = UIImagePickerController()
        viewAlbume.delegate = self
        viewAlbume.sourceType = .photoLibrary
        present(viewAlbume, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        peekPhoto.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
        shareButton.isEnabled = true
    }
    
    

    

}
