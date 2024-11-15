//
//  Movie.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 15.11.2024.
//

import Foundation
import UIKit

class Movie: DetailItem {
    var title: String
    var description: String
    var image: UIImage

    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}
