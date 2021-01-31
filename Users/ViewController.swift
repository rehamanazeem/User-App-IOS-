//
//  ViewController.swift
//  Users
//
//  Created by Azeem Ur Rehman on 31/01/21.
//

import FirebaseDatabase
import FirebaseAuth
import UIKit

//user list section

class userViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    Setting up database reference
    var database = Database.database().reference()
    var databaseHandle:DatabaseHandle?

    
    @IBOutlet fileprivate var tableView: UITableView!
    
    var myData = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "userTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "userTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        

        databaseHandle =  database.child("Users").observe(.childAdded) { (snapshot) in
            self.myData.append(snapshot.value as! Dictionary< String, String>)
            self.tableView.reloadData()
        }
        
    }
    
    
//        Table view funcs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell",
                                                 for: indexPath) as! userTableViewCell
        
        cell.userName.text = myData[indexPath.row]["First Name"]
        cell.userdetail.text = "\(myData[indexPath.row]["Gender"] ?? "Something") | \(myData[indexPath.row]["State"] ?? "Something")"
        return cell
    }


}

//Enroll section

class enrollViewController: UIViewController {
    
    
    private let database = Database.database().reference()

    @IBOutlet fileprivate var firstName: UITextField!
    @IBOutlet fileprivate var lastName: UITextField!
    @IBOutlet fileprivate var dateOfBirth: UITextField!
    @IBOutlet fileprivate var gender: UITextField!
    @IBOutlet fileprivate var country: UITextField!
    @IBOutlet fileprivate var state: UITextField!
    @IBOutlet fileprivate var hometown: UITextField!
    @IBOutlet fileprivate var phoneNumber: UITextField!
    @IBOutlet fileprivate var telephone: UITextField!
    
    
    @IBAction func addUser(_ sender: UIButton) {
        
        let valsDict = ["First Name":"\(firstName.text!)",
                      "Last Name":"\(lastName.text!)",
                      "Date of Birth":"\(dateOfBirth.text!)",
                      "Gender":"\(gender.text!)",
                      "Country":"\(country.text!)",
                      "State":"\(state.text!)",
                      "Home town":"\(hometown.text!)",
                      "Phone Number":"\(phoneNumber.text!)",
                      "Telephone":"\(telephone.text!)"
        ]

        database.child("Users").childByAutoId().setValue(valsDict)
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
}
