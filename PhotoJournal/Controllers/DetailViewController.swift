//
//  DetailViewController.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import ImageKit

protocol FavoriteDelegate: AnyObject {
    func didFavorite(_ detailVC: DetailViewController, photo: Photo)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    public var favorite: Favorite?
    public var photo: Photo?
    private var user: User?
    
    weak var delegate: FavoriteDelegate?
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(photo: Photo? = nil, favorite: Favorite? = nil) {
        if let photo = photo {
            photoImage.getImage(with: photo.largeImageURL) { [weak self] (result) in
                switch result {
                case .failure:
                    self?.photoImage.backgroundColor = .gray
                case .success(let image):
                    DispatchQueue.main.async {
                        self?.photoImage.image = image
                    }
                }
            }
            let tags = photo.tags.components(separatedBy: ",")
            tagsLabel.text = tags.joined(separator: " #")
            
        } else if let favorite = favorite {
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
        favorite = CoreDataManager.shared.addToFavorite(photoURL: photo.largeImageURL, user: user)
        delegate?.didFavorite(self, photo: photo)
        if isFavorite {
            favoriteButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor = .red
        } else {
            favoriteButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .black
        }
    }
    
}
