//
//  EditProfileViewController.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

protocol CreateUserDelegate: AnyObject {
    func didCreateUser(_ editVC: EditProfileViewController, user: User)
}

class EditProfileViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    weak var delegate: CreateUserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datepicker.maximumDate = Date()
    }
    

    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let username = nameTextfield.text, !username.isEmpty else {
            print("missing fields")
            return
        }
        let birthday = datepicker.date
        let user = CoreDataManager.shared.createUser(name: username, dob: birthday)
        delegate?.didCreateUser(self, user: user)
        dismiss(animated: true)
        
    }
}
