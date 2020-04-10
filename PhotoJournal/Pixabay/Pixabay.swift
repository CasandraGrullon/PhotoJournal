//
//  Pixabay.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation

struct Pixabay: Codable {
    let hits: [Photo]
}
struct Photo: Codable {
    let tags: String
    let largeImageURL: String
}
