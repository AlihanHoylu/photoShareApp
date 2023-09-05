//
//  ViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: Any) {
            
        if emailTextField.text != "" && passwordTextField.text != ""{
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (auth, error) in
                if error != nil{
                    self.alert(allertTitle: "Eror", allertSubTitle: error?.localizedDescription ?? "Error have not Descript" )
                }else{
                    self.performSegue(withIdentifier: "toFeed", sender: nil)
                }
            }
            
        }else{
            alert(allertTitle: "Eror", allertSubTitle: "Write your email and password")
        }
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != ""{
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (auth, error) in
                if error != nil{
                    self.alert(allertTitle: "Eror", allertSubTitle: error?.localizedDescription ?? "Error have not Descript" )
                }else{
                    self.performSegue(withIdentifier: "toFeed", sender: nil)
                }
            }
            
        }else{
            alert(allertTitle: "Eror", allertSubTitle: "Write your email and password")
        }
        
    }
    
    func alert(allertTitle:String, allertSubTitle:String){
        
        let eror = UIAlertController(title: allertTitle, message: allertSubTitle, preferredStyle: UIAlertController.Style.alert)
        let erorAction = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        eror.addAction(erorAction)
        present(eror, animated: true)
    }
    
    
    
}

