//
//  FavoriteCell.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import ImageKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    
    public func configureCell(favorite: Favorite) {
        guard let image = favorite.photoURL else {return}
        favoriteImage.getImage(with: image) { [weak self] (result) in
            switch result {
            case .failure:
                self?.favoriteImage.backgroundColor = .gray
            case .success(let image):
                DispatchQueue.main.async {
                    self?.favoriteImage.image = image
                }
            }
        }
    }
    
}
