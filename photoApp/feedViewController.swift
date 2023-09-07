//
//  feedViewController.swift
//  photoApp
//
//  Created by Alihan Hoylu on 5.09.2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import SDWebImage

class feedViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    
    var useremail = [String]()
    var descp = [String]()
    var photourl = [String]()
    
    var post = [Post]()
    
    
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
        cell.descpTextLabel.text = post[indexPath.row].descp
        cell.emailTextLabel.text = post[indexPath.row].email
        cell.feedImage.sd_setImage(with: URL(string: post[indexPath.row].url))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func getData(){
        
        let firestore = Firestore.firestore()
        
        firestore.collection("Post").order(by: "tarih", descending: true).addSnapshotListener { (snapshot, eror) in
            
            if eror != nil{
                print("eror")
            }else{
                
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    self.post.removeAll()
                    
                    for document in snapshot!.documents {
                        
                                                
                        let id = document.documentID
                        print(id)
                        
                        if let name = document.get("email") as? String{
                            if let descptrip = document.get("descp") as? String{
                                if let url = document.get("url") as? String{
                                    
                                    let newpos = Post(email: name, descp: descptrip, url: url)
                                    
                                    self.post.append(newpos)
                                    
                                }
                            }
                        }
                    }
                    
                }
                self.feedTableView.reloadData()
            }
            
        }
        
    }

}
