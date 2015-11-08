//
//  ViewController.swift
//  BullsEye
//
//  Created by Shaohui Yang on 11/5/15.
//  Copyright © 2015 Shaohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var slider:UISlider!
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved (slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound () {
        currentValue = Int(lroundf(slider.value))
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
}

