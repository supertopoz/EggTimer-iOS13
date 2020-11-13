//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer?
    
    let eggTimes = ["Soft": 360, "Medium": 2, "Hard": 3]
    var timer: Timer?
    var secondsPassed = 0
    var totalTime = 0
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        countDownTimer()
        self.setTitle(hardness)
    }
    
    func countDownTimer(){
        progressBar.progress = 0.0
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <  self.totalTime {
                self.secondsPassed += 1
                self.incrementProgress()
            } else {
                self.timer?.invalidate()
                self.setTitle("Done!")
                self.secondsPassed = 0
                self.totalTime = 0
                self.ringBell()
            }
        }
    }
    
    func ringBell() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print(error.localizedDescription)
            // couldn't load file :(
        }
    }
    
    func incrementProgress(){
        let progress = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = progress
    }
    
    func setTitle(_ text: String){
        titleLabel.text = text
    }
    
}
