//
//  DetailViewController.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import ImageKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    public var favorite: Favorite?
    public var photo: Photo?
    private var user: User?
        
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if photo != nil {
            updateUI(photo: photo)
        } else {
            updateUI(favorite: favorite)
        }
        fetchUser()
    }
    private func fetchUser() {
        user = CoreDataManager.shared.fetchUsers().last
    }
    
    private func updateUI(photo: Photo? = nil, favorite: Favorite? = nil) {
        if let photo = photo{
            photoImage.getImage(with: photo.largeImageURL) { [weak self] (result) in
                switch result {
                case .failure:
                    self?.photoImage.backgroundColor = .gray
                case .success(let image):
                    DispatchQueue.main.async {
                        self?.photoImage.image = image
                        self?.tagsLabel.text = photo.tags
                    }
                }
            }
        }
        else if let favorite = favorite{
            photoImage.getImage(with: favorite.photoURL ?? "") { [weak self] (result) in
                switch result {
                case .failure:
                    self?.photoImage.backgroundColor = .gray
                case .success(let image):
                    DispatchQueue.main.async {
                        self?.photoImage.image = image
                    }
                }
            }
        }
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        guard let photo = photo, let user = user else {return}
        
        isFavorite.toggle()
        var fave = Favorite()
        
        if isFavorite {
            favoriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor = .red
            fave = CoreDataManager.shared.addToFavorite(photoURL: photo.largeImageURL, user: user)
        } else {
            favoriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .black
            CoreDataManager.shared.deleteFromFavorites(fave)
        }
    }
    
}
