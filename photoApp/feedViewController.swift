//
//  feedViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit

class feedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.dataSource = self
        feedTableView.delegate = self
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! feedCell
        cell.descpTextLabel.text = "yorum"
        cell.emailTextLabel.text = "alihan"
        cell.feedImage.image = UIImage(named: "Ekran Resmi 2023-09-05 18.49.07")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

}
