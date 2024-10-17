//
//  ViewController.swift
//  EggTimerApp
//
//  Created by Инара Алмагамбетова on 17.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var softBoiledImageView: UIImageView!
    @IBOutlet weak var mediumBoiledImageView: UIImageView!
    @IBOutlet weak var hardBoiledImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!

    var audioPlayer: AVAudioPlayer?

    @IBAction func softBoiledButtonTapped(_ sender: UIButton) {
        startTimer(for: "softBoiled")
    }

    @IBAction func mediumBoiledButtonTapped(_ sender: UIButton) {
        startTimer(for: "mediumBoiled")
    }

    @IBAction func hardBoiledButtonTapped(_ sender: UIButton) {
        startTimer(for: "hardBoiled")
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        stopTimer()
    }

    // Определите ваши временные константы
    let softBoiledDuration: Int = 300   // 5 минут в секундах
    let mediumBoiledDuration: Int = 420  // 7 минут в секундах
    let hardBoiledDuration: Int = 720    // 12 минут в секундах

    var duration: Double = 0
    var timer: Timer?
    var totalDuration: Float = 0.0 // Добавляем переменную для хранения общего времени

    func startTimer(for eggType: String) {
        // Устанавливаем duration и инициализируем progressView
        switch eggType {
        case "softBoiled":
            duration = Double(softBoiledDuration)
            totalDuration = Float(softBoiledDuration)
        case "mediumBoiled":
            duration = Double(mediumBoiledDuration)
            totalDuration = Float(mediumBoiledDuration)
        case "hardBoiled":
            duration = Double(hardBoiledDuration)
            totalDuration = Float(hardBoiledDuration)
        default:
            return
        }
        
        // Устанавливаем прогресс бар на 100%
        progressView.progress = 1.0
        timerLabel.text = formatTime(duration)

        timer?.invalidate() // Сбрасываем предыдущий таймер
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if duration > 0 {
            duration -= 1
            
            // Обновляем прогресс бар
            progressView.progress = Float(duration) / totalDuration
            timerLabel.text = formatTime(duration)
        } else {
            timer?.invalidate()
            playAlarmSound()
        }
    }

    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func playAlarmSound() {
        if let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Ошибка воспроизведения звука: \(error)")
            }
        }
    }

    func stopTimer() {
        timer?.invalidate() // Остановить таймер
        timer = nil // Сбросить таймер
        duration = 0 // Сбросить оставшееся время
        progressView.progress = 0 // Сбросить индикатор выполнения
        timerLabel.text = "00:00" // Сбросить метку времени
        audioPlayer?.stop() // Остановить звук
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGestures()
    }
    
    private func setupTapGestures() {
        let softBoiledTap = UITapGestureRecognizer(target: self, action: #selector(softBoiledTapped))
        softBoiledImageView.addGestureRecognizer(softBoiledTap)
        softBoiledImageView.isUserInteractionEnabled = true

        let mediumBoiledTap = UITapGestureRecognizer(target: self, action: #selector(mediumBoiledTapped))
        mediumBoiledImageView.addGestureRecognizer(mediumBoiledTap)
        mediumBoiledImageView.isUserInteractionEnabled = true

        let hardBoiledTap = UITapGestureRecognizer(target: self, action: #selector(hardBoiledTapped))
        hardBoiledImageView.addGestureRecognizer(hardBoiledTap)
        hardBoiledImageView.isUserInteractionEnabled = true
    }
    
    @objc private func softBoiledTapped() {
        provideFeedback(for: softBoiledImageView)
        startTimer(for: "softBoiled")
    }
    
    @objc private func mediumBoiledTapped() {
        provideFeedback(for: mediumBoiledImageView)
        startTimer(for: "mediumBoiled")
    }
    
    @objc private func hardBoiledTapped() {
        provideFeedback(for: hardBoiledImageView)
        startTimer(for: "hardBoiled")
    }
    
    private func provideFeedback(for imageView: UIImageView) {
        UIView.animate(withDuration: 0.1, animations: {
            imageView.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                imageView.alpha = 1.0
            }
        }
    }
}
