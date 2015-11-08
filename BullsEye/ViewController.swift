//
//  ViewController.swift
//  BullsEye
//
//  Created by Shaohui Yang on 11/5/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var rounds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "NOt even close..."
        }
        
        score += points
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nYour scored \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    @IBAction func sliderMoved (slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewGame() {
        score = 0
        rounds = 0
        startNewRound()
    }
    func startNewRound() {
        rounds += 1
        currentValue = Int(lroundf(slider.value))
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
    }
    
}

