//
//  DetailViewController.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
    }
    
}
