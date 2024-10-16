//
//  ViewController.swift
//  Xylophone
//
//  Created by Инара Алмагамбетова on 19.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(note: String) {
        if let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Ошибка при воспроизведении звука.")
            }
        }
    }

    @IBAction func playNoteA(_ sender: Any) {
        playSound(note: "A")
    }
    
    @IBAction func playNoteB(_ sender: Any) {
        playSound(note: "B")
    }
    
    
    @IBAction func playNoteC(_ sender: Any) {
        playSound(note: "C")
    }
    
    
    @IBAction func playNoteD(_ sender: Any) {
        playSound(note: "D")
    }
    
    @IBAction func playNoteE(_ sender: Any) {
        playSound(note: "E")
    }
    
    @IBAction func playNoteF(_ sender: Any) {
        playSound(note: "F")
    }
    
    @IBAction func playNoteG(_ sender: Any) {
        playSound(note: "G")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

