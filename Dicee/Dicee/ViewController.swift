//
//  ViewController.swift
//  Dicee
//
//  Created by Инара Алмагамбетова on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // UIImageView для кубиков
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    // Метод для изменения кубиков при нажатии кнопки
    @IBAction func rollButtonPressed(_ sender: UIButton) {
//        diceImageView1.image = UIImage(named: "dice3")
//        diceImageView2.image = UIImage(named: "dice2")
        // Генерируем случайные номерова кубиков
        let randomIndex1 = Int.random(in: 0..<diceImages.count)
        var randomIndex2 = Int.random(in: 0..<diceImages.count)
        
        // Чтобы два кубика не были одинаковыми
        while randomIndex1 == randomIndex2 {
                randomIndex2 = Int.random(in: 0..<diceImages.count)
                }
        
        // Меняем изображения кубиков
        diceImageView1.image = UIImage(named: diceImages[randomIndex1])
        diceImageView2.image = UIImage(named: diceImages[randomIndex2])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollButtonPressed(UIButton())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageView1.image = UIImage(named: "dice1")
        diceImageView2.image = UIImage(named: "dice2")
        // Do any additional setup after loading the view.
    }
    
}

