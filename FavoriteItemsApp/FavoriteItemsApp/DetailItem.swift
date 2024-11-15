//
//  DetailItem.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 15.11.2024.
//

import Foundation
import UIKit

protocol DetailItem {
    var title: String { get }
    var description: String { get }
    var image: UIImage { get }
}
