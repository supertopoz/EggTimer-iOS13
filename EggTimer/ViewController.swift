//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 10, "Medium": 2, "Hard": 3]
    var timer: Timer?
    var secondsPassed = 0
    var totalTime = 0
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        countDownTimer()
        titleLabel.text = hardness
    }
    
    func countDownTimer(){
        progressBar.progress = 0.0
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <  self.totalTime {
                self.secondsPassed += 1
                self.incrementProgress()
            } else {
                self.timerStopped()
            }
        }
    }
    
    func incrementProgress(){
        let progress = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = progress
    }
    
    func setTitle(){
        titleLabel.text = "Stopped"
    }
    
    func timerStopped() {
        setTitle()
        self.timer?.invalidate()
    }

}
