//
//  settingsViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit

class settingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func logOutButton(_ sender: Any) {
        performSegue(withIdentifier: "backSign", sender: nil)
    }
    

}
