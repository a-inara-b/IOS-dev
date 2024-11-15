//
//  MusicTableViewController.swift
//  FavoriteItemsApp
//
//  Created by Инара Алмагамбетова on 14.11.2024.
//

import UIKit

class MusicTableViewController: UITableViewController {

    var music: [Music] = [
        Music(title: "Shape of You", description: "One of Ed Sheeran's biggest hits, blending tropical house and pop elements.", image: UIImage(named: "shape_of_you")!),
        Music(title: "Blinding Lights", description: "A global hit by The Weeknd, known for its retro 80s synthwave sound and catchy melody.", image: UIImage(named: "blinding_lights")!),
        Music(title: "Uptown Funk", description: "Mark Ronson and Bruno Mars' funky anthem, characterized by its energetic beat and catchy hook.", image: UIImage(named: "uptown_funk")!),
        Music(title: "Rolling in the Deep", description: "Adele's powerhouse ballad that combines soul and pop, showcasing her powerful voice.", image: UIImage(named: "rolling_in_the_deep")!),
        Music(title: "Bad Guy", description: "Billie Eilish's breakout single with its minimalist production and dark pop aesthetic.", image: UIImage(named: "bad_guy")!),
        Music(title: "Old Town Road", description: "Lil Nas X's genre-blending hit that combined country and hip-hop for viral success.", image: UIImage(named: "old_town_road")!),
        Music(title: "Despacito", description: "Luis Fonsi and Daddy Yankee's reggaeton-infused track that became a worldwide sensation.", image: UIImage(named: "despacito")!),
        Music(title: "Levitating", description: "A catchy pop track by Dua Lipa with a futuristic sound and fun, danceable beat.", image: UIImage(named: "levitating")!),
        Music(title: "Closer", description: "The Chainsmokers and Halsey's smash hit that topped charts worldwide with its catchy EDM-pop fusion.", image: UIImage(named: "closer")!),
        Music(title: "Dance Monkey", description: "A pop hit by Tones and I, featuring catchy vocals and a fun, danceable rhythm.", image: UIImage(named: "dance_monkey")!)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        cell.textLabel?.text = music[indexPath.row].title
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                
                let selectedMusic = music[indexPath.row]
                
                // Передаем данные в DetailViewController
                detailVC.itemTitle = selectedMusic.title
                detailVC.itemDescription = selectedMusic.description
                detailVC.itemImage = selectedMusic.image
                
                // Отладка: проверка передаваемых данных
                print("Preparing segue with title: \(selectedMusic.title), description: \(selectedMusic.description)")
            }
        }
    }
}
