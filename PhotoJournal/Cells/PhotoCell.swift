//
//  PhotoCell.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import ImageKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    public func configureCell(photo: Photo) {
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
    }
    
    public func configureCell(favorite: Favorite) {
       // guard let image = favorite.photoURL else {return}
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
