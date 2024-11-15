//
//  DetailViewController.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 14.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    var item: DetailItem?
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    var itemTitle: String?
    var itemDescription: String?
    var itemImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка UI-элементов с переданными данными
        titleLabel.text = itemTitle
        descriptionLabel.text = itemDescription
        imageView.image = itemImage
    }
    
}
