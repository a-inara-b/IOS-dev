//
//  CustomTableViewCell.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 09.11.2024.
//


// CustomTableViewCell.swift
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var subtitleL: UILabel!

    // Метод для настройки ячейки с данными
    func configure(with item: FavoriteItem) {
        titleL.text = item.title
        subtitleL.text = item.subtitle
    }
}

