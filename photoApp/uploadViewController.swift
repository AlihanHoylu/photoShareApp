//
//  uploadViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

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
    
    

    @IBAction func shareButton(_ sender: Any) {
        self.shareButton.isEnabled = false
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let storageMedia = storageRef.child("Media")
        
        if let data = peekPhoto.image?.jpegData(compressionQuality: 0.5){
            let id = UUID().uuidString
            let photoRef = storageMedia.child("\(id).jpeg")
            
            photoRef.putData(data, metadata: nil) { (stroged,eror) in
                if eror != nil{
                    self.errorMessage(title: "Eror", subTitle: eror?.localizedDescription ?? "Eror have not descp")
                }else{
                    
                    photoRef.downloadURL { (url, eror) in
                        if eror == nil{
                            let imageurl = url?.absoluteString
                            
                            if let imageurl = imageurl{
                                
                                let firestore = Firestore.firestore()
                                
                                let addData = ["url":imageurl,"descp":self.descpTextField.text!,"email":Auth.auth().currentUser?.email,"tarih":FieldValue.serverTimestamp()] as [String:Any]
                                
                                firestore.collection("Post").addDocument(data: addData) { eror in
                                    if eror != nil{
                                        self.errorMessage(title: "Eror", subTitle: eror?.localizedDescription ?? "Eror have noor descp")
                                    }else{
                                        self.peekPhoto.image = UIImage(named: "Ekran Resmi 2023-09-05 18.49.07")
                                        self.descpTextField.text = ""
                                        self.shareButton.isEnabled = false
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                                    
                                
                                
                            }
                            
                            
                        }else{
                            self.errorMessage(title: "Eror", subTitle: eror?.localizedDescription ?? "Eror have not descp")
                        }
                            
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    func errorMessage(title:String,subTitle:String){
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        alert.addAction(action)
        present(alert, animated: true)
        self.shareButton.isEnabled = true
 
        
    }
    

}
