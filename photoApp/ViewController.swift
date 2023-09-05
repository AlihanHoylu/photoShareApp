//
//  ViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toFeed", sender: nil)
    }
    
}

