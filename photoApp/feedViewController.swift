//
//  feedViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class feedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    
    var useremail = [String]()
    var descp = [String]()
    var photourl = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.dataSource = self
        feedTableView.delegate = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! feedCell
        cell.descpTextLabel.text = descp[indexPath.row]
        cell.emailTextLabel.text = useremail[indexPath.row]
        cell.feedImage.image = UIImage(named: "Ekran Resmi 2023-09-05 18.49.07")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useremail.count
    }
    
    func getData(){
        
        let firestore = Firestore.firestore()
        
        firestore.collection("Post").addSnapshotListener { (snapshot, eror) in
            
            if eror != nil{
                print("eror")
            }else{
                
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    for document in snapshot!.documents {
                        
                        let id = document.documentID
                        print(id)
                        
                        if let name = document.get("email") as? String{
                            self.useremail.append(name)
                            print(name)
                        }
                        
                        if let descptrip = document.get("descp") as? String{
                            self.descp.append(descptrip)
                        }
                        
                        if let url = document.get("url") as? String{
                            self.photourl.append(url)
                        }
                        
                        
                    }
                    
                }
                self.feedTableView.reloadData()
            }
            
        }
        
    }

}
