//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
    // Declare instance variables here

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
       
        
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        
        
        //TODO: Set the tapGesture here:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        // allow the tableview to recogonize that the user tapped somewhere within the table view.
        messageTableView.addGestureRecognizer(tapGesture)

        //TODO: Register your MessageCell.xib file here:
        // I only have to do this if we're using a custom xib file
        // Nib is just the old name for Xib. To register, xcode is is expecting a UI Nib file.
        // I'm not providing a path for xib file, so I'm not providing a bundle.
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        // the  indexpath includes information for row and section?
        let messageArray = ["First", "Second", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mollis, diam eleifend sodales dignissim, mauris sapien semper ipsum, ac consequat lacus quam ac lectus. Morbi a eros non ligula maximus vulputate.", "Third"]
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
    }
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }
    
    
    //TODO: Declare configureTableView here:
    // This is pretty dope...
    func configureTableView(){
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120
        
    }
    
    
    ///////////////////////////////////////////
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    // This method is automatically callded whenever the user taps inside
    // the text field.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        heightConstraint.constant = 308 + 50
        // then we have to updated the view
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            // this ^^^ will update the view if we need too.
        }
    }
    
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        heightConstraint.constant = 50
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error, there was a problem signing out")
        }
    }
    


}
