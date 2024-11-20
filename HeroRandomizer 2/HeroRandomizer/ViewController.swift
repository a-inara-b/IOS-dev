//
//  ViewController.swift
//  HeroRandomizer
//
//  Created by Inara Almagambetova on 21.11.2024.
//

import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let images: HeroImage

    struct Biography: Decodable {
        let fullName: String
        let placeOfBirth: String
        let alignment: String
    }

    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var heroDescription: UILabel!
    @IBOutlet private weak var heroTitle: UILabel!
    @IBOutlet private weak var heroIntelligenceLabel: UILabel!
    @IBOutlet private weak var heroStrengthLabel: UILabel!
    @IBOutlet private weak var heroSpeedLabel: UILabel!
    @IBOutlet private weak var heroDurabilityLabel: UILabel!
    @IBOutlet private weak var heroPowerLabel: UILabel!
    @IBOutlet private weak var heroCombatLabel: UILabel!
    @IBOutlet private weak var placeOfBirthLabel: UILabel!
    @IBOutlet private weak var alignmentLabel: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }

    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            DispatchQueue.main.async {
                
                UIView.transition(with: self.heroImage,
                                  duration: 1.1,
                                  options: .transitionCrossDissolve,
                                  animations: { self.heroImage.image = heroImage },
                                  completion: nil)
                
                self.heroTitle.text = hero.name
                self.heroDescription.text = hero.biography.fullName
                self.heroIntelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
                self.heroStrengthLabel.text = "Strength: \(hero.powerstats.strength)"
                self.heroSpeedLabel.text = "Speed: \(hero.powerstats.speed)"
                self.heroDurabilityLabel.text = "Durability: \(hero.powerstats.durability)"
                self.heroPowerLabel.text = "Power: \(hero.powerstats.power)"
                self.heroCombatLabel.text = "Combat: \(hero.powerstats.combat)"
                self.placeOfBirthLabel.text = "Place of birth: \(hero.biography.placeOfBirth)"
                self.alignmentLabel.text = "Alignment: \(hero.biography.alignment)"
                self.heroImage.image = heroImage
            }
        } catch {
            DispatchQueue.main.async {
                self.heroTitle.text = error.localizedDescription + "\nReRoll again!"
                self.heroDescription.text = ""
                self.heroImage.image = nil
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

//    private func handleErrorIfNeeded(error: Error?) -> Bool {
//        guard let error else {
//            return false
//        }
//        print(error.localizedDescription)
//        return true
//    }
    
    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        DispatchQueue.main.async {
            self.heroTitle.text = "Error: \(error.localizedDescription)"
            self.heroDescription.text = "Check your connection or try again later."
            self.heroImage.image = nil
        }
        return true
    }
}
