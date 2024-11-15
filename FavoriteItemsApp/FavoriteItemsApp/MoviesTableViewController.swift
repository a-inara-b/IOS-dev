//
//  MoviesTableViewController.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 14.11.2024.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    var movies = [
        Movie(title: "Inception", description: "A thief who enters the dreams of others to steal secrets is tasked with planting an idea into a CEO's mind.", image: UIImage(named: "inception")!),
        Movie(title: "The Dark Knight", description: "Batman faces off against the Joker, a criminal mastermind who seeks to create chaos in Gotham City.", image: UIImage(named: "dark_knight")!),
        Movie(title: "The Shawshank Redemption", description: "Two imprisoned men form a friendship, finding solace and eventual redemption through acts of common decency.", image: UIImage(named: "shawshank_redemption")!),
        Movie(title: "The Matrix", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", image: UIImage(named: "matrix")!),
        Movie(title: "Forrest Gump", description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an extraordinary life.", image: UIImage(named: "forrest_gump")!),
        Movie(title: "The Godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", image: UIImage(named: "godfather")!),
        Movie(title: "Titanic", description: "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.", image: UIImage(named: "titanic")!),
        Movie(title: "Star Wars: A New Hope", description: "Luke Skywalker embarks on a journey to rescue a princess and discover the mysteries of the Force.", image: UIImage(named: "star_wars")!),
        Movie(title: "Pulp Fiction", description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", image: UIImage(named: "pulp_fiction")!),
        Movie(title: "Avatar", description: "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.", image: UIImage(named: "avatar")!)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                
                let selectedMovie = movies[indexPath.row]
                
                // Передаем данные в DetailViewController
                detailVC.itemTitle = selectedMovie.title
                detailVC.itemDescription = selectedMovie.description
                detailVC.itemImage = selectedMovie.image
                
                // Отладка: проверка передаваемых данных
                print("Preparing segue with title: \(selectedMovie.title), description: \(selectedMovie.description)")
            }
        }
    }
}
