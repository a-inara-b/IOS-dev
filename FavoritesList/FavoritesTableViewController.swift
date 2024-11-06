//
//  FavoritesTableViewController.swift
//  FavoritesList
//
//  Created by Инара Алмагамбетова on 08.11.2024.
//

import Foundation
import UIKit

class FavoritesTableViewController: UITableViewController {
    // Здесь будут методы и переменные для работы с таблицей
    
    let favoriteItems = ["451° по Фаренгейту", "1984", "Мастер и Маргарита", "Три товарища", "Цветы для Элджернона", "Портрет Дориана Грея", "Маленький принц","Над пропастью во ржи", "Анна Каренина", "Убить пересмешника"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Регистрация ячейки
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FavoriteCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        cell.textLabel?.text = favoriteItems[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Переход на экран деталей при нажатии на элемент
        performSegue(withIdentifier: "showDetailSegue", sender: favoriteItems[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let detailVC = segue.destination as? DetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                detailVC.item = favoriteItems[indexPath.row]
            }
        }
    }
}
