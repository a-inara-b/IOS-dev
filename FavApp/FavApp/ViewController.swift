//
//  ViewController.swift
//  FavouriteApp
//
//  Created by Ляззат Аманбаева on 09.11.2024.
//

// ViewController.swift

// ViewController.swift
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    
    
    let favoriteItems = [
        FavoriteItem(title: "Interstellar", subtitle: "Sci-Fi", description: "In a dystopian future, a team of astronauts embarks on a journey through a wormhole in space to find a new habitable planet for humanity. This epic space adventure explores themes of love, sacrifice, and the survival of the human race."),
        FavoriteItem(title: "Pulp Fiction", subtitle: "Crime", description: "A darkly comedic intertwining of multiple stories involving mobsters, a boxer, and small-time criminals. With nonlinear storytelling, Pulp Fiction delves into crime and morality with a unique style and unforgettable dialogue."),
        FavoriteItem(title: "La La Land", subtitle: "Musical", description: "Two aspiring artists, a jazz musician and an actress, fall in love while struggling to make it in Los Angeles. This vibrant musical captures the magic of following one’s dreams and the sacrifices that come with it."),
        FavoriteItem(title: "Parasite", subtitle: "Thriller", description: "A poor family cunningly ingrains themselves into the lives of a wealthy household, only to find themselves entangled in a series of unexpected and dangerous events. This thriller unveils themes of class divide and survival."),
        FavoriteItem(title: "The Grand Budapest Hotel", subtitle: "Comedy", description: "Set in a fictional European hotel, a concierge and a lobby boy find themselves in the midst of a murder investigation and a missing fortune. With whimsical visuals, this comedy offers a quirky adventure with a colorful ensemble of characters.")
    ]


        override func viewDidLoad() {
            super.viewDidLoad()

            // Настройка делегатов для таблицы
            tableView.dataSource = self
            tableView.delegate = self
            
            // Регистрация кастомной ячейки (если необходимо)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FavoriteItemCell")
        }

    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = favoriteItems[indexPath.row]
            performSegue(withIdentifier: "showDetail", sender: selectedItem)
        }

        // Подготовка данных перед переходом на DetailViewController
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let detailVC = segue.destination as? DetailViewController,
                   let item = sender as? FavoriteItem {
                    detailVC.favoriteItem = item
                }
            }
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath)
            let item = favoriteItems[indexPath.row]
            
    
            cell.textLabel?.text = item.title  // Название фильма
            cell.detailTextLabel?.text = item.subtitle // Жанр фильма (подзаголовок)
            
            return cell
        }
}

