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
    
    let eggTimes = ["Soft": 1, "Medium": 2, "Hard": 3]
    var timer: Timer?
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let seconds = eggTimes[hardness]!
        countDownTimer(countDown: seconds)
    }
    
    func countDownTimer(countDown: Int){
        self.timer?.invalidate()
        
        var secondsRemaining: Int? = countDown
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining! > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining! -= 1
            } else {
                self.timerStopped()
            }
        }
    }
    
    func setTitle(){
        titleLabel.text = "Stopped"
    }
    
    func timerStopped() {
        setTitle()
        self.timer?.invalidate()
    }

}
