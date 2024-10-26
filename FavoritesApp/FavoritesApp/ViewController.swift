//
//  ViewController.swift
//  FavoritesApp
//
//  Created by Инара Алмагамбетова on 25.10.2024.
//

import UIKit

struct Book {
    let title: String
    let author: String
    let genre: String
    let coverImage: String
}

class ViewController: UIViewController {
    
    
    let books = [
        Book(title: "451° по Фаренгейту", author: "Рэй Брэдбери", genre: "Роман-антиутопия", coverImage: "451"),
        Book(title: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Роман", coverImage: "master"),
        Book(title: "Три товарища", author: "Эрих Мария Ремарк", genre: "Роман", coverImage: "3tov"),
        Book(title: "Цветы для Элджернона", author: "Дэниел Киз", genre: "Научная фантастика", coverImage: "eldger"),
        Book(title: "Портрет Дориана Грея", author: "Оскар Уайльд", genre: "Повесть", coverImage: "dorian"),
        Book(title: "Маленький принц", author: "Антуан де Сент-Экзюпери", genre: "Философская сказка", coverImage: "prince"),
        Book(title: "Над пропастью во ржи", author: "Джером Д. Сэлинджер", genre: "Роман", coverImage: "propast"),
        Book(title: "Анна Каренина", author: "Лев Толстой", genre: "Роман", coverImage: "anna"),
        Book(title: "Убить пересмешника", author: "Харпер Ли", genre: "Роман", coverImage: "kill"),
        Book(title: "Преступление и наказание", author: "Фёдор Достоевский", genre: "Роман", coverImage: "prestup"),
    ]
    

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // Устанавливаем dataSource
        tableView.delegate = self // Устанавливаем delegate
    }
}
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return books.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
            let book = books[indexPath.row]
            
            cell.titleLabel.text = book.title
            cell.subtitleLabel.text = book.author
            cell.itemImageView.image = UIImage(named: book.coverImage)
            
            return cell
        }
    }

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Действия при нажатии на ячейку
        tableView.deselectRow(at: indexPath, animated: true) // Снимаем выделение
    }
}

