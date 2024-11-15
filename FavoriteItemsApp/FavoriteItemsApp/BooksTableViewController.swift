//
//  BooksTableViewController.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 14.11.2024.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    var books: [Book] = [
        Book(title: "To Kill a Mockingbird", description: "A young girl growing up in the racially segregated American South learns about the injustice of racism through the eyes of her father, a lawyer who defends a black man accused of rape.", image: UIImage(named: "mockingbird")!),
        Book(title: "1984", description: "In a dystopian future where the government watches every move of its citizens, a man dares to challenge the oppressive regime of Big Brother.", image: UIImage(named: "1984")!),
        Book(title: "The Great Gatsby", description: "Set in the Roaring Twenties, a mysterious millionaire's obsession with a woman leads to tragedy as he seeks to rekindle a past romance.", image: UIImage(named: "gatsby")!),
        Book(title: "Pride and Prejudice", description: "In early 19th-century England, a young woman navigates societal expectations, love, and class distinctions while facing the unpredictable affections of a wealthy gentleman.", image: UIImage(named: "pride_prejudice")!),
        Book(title: "Harry Potter and the Sorcerer's Stone", description: "A young boy discovers that he is a wizard and attends a magical school, where he uncovers the secrets of his past and the dark wizard who killed his parents.", image: UIImage(named: "harry_potter")!),
        Book(title: "The Catcher in the Rye", description: "A teenager reflects on his experiences as he navigates the complexities of growing up, mental health, and a desire for authenticity in a world of phoniness.", image: UIImage(named: "catcher_rye")!),
        Book(title: "The Hobbit", description: "Bilbo Baggins, a hobbit, embarks on an epic journey with a group of dwarves to reclaim their homeland from a dragon and encounters a world of magic, adventure, and danger.", image: UIImage(named: "hobbit")!),
        Book(title: "Moby-Dick", description: "A sea captain's obsession with hunting down the great white whale, Moby-Dick, becomes a symbol of revenge and destruction that threatens the lives of everyone aboard his ship.", image: UIImage(named: "moby_dick")!),
        Book(title: "The Lord of the Rings: The Fellowship of the Ring", description: "Frodo Baggins, a hobbit, is tasked with destroying a powerful ring that could bring ruin to Middle-earth, as he embarks on a perilous journey with a fellowship of companions.", image: UIImage(named: "lord_of_rings")!),
        Book(title: "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe", description: "Four siblings enter a magical land where they help Aslan, the lion, defeat the White Witch and restore peace and freedom to Narnia.", image: UIImage(named: "chronicles_narnia")!)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                
                let selectedBook = books[indexPath.row]
                
                // Передаем данные в DetailViewController
                detailVC.itemTitle = selectedBook.title
                detailVC.itemDescription = selectedBook.description
                detailVC.itemImage = selectedBook.image
                
                // Отладка: проверка передаваемых данных
                print("Preparing segue with title: \(selectedBook.title), description: \(selectedBook.description)")
            }
        }
    }
}
