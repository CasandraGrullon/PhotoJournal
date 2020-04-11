//
//  ProfileViewController.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    public var currentUser: User? {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
    }
    
    private func updateUI() {
        userNameLabel.text = currentUser?.name
        let birthday = currentUser?.dob?.convertDate(date: currentUser?.dob ?? Date())
        birthdayLabel.text = birthday 
    }
    private func fetchUsers() {
        currentUser = CoreDataManager.shared.fetchUsers().first
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editVC = segue.destination as? EditProfileViewController else {
            fatalError("unable to segue to edit vc")
        }
        editVC.delegate = self
    }

}
extension ProfileViewController: CreateUserDelegate {
    func didCreateUser(_ editVC: EditProfileViewController, user: User) {
        currentUser = user
    }
    
    
}
extension Date {
    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}
