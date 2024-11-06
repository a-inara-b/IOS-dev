//
//  DetailViewController.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 10.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    // Ваши аутлеты и код
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var subtitleL: UILabel!
    @IBOutlet weak var descriptionL: UILabel!
    
    var favoriteItem: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = favoriteItem {
            titleL.text = item.title          // Название фильма
            subtitleL.text = item.subtitle    // Жанр фильма
            descriptionL.text = item.description  // Описание фильма (длинный текст)
        }
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtontap))
            self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtontap() {
        self.navigationController?.popViewController(animated: true)
    }
}
