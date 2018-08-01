//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Amanda Savluchinske on 01/08/2018.
//  Copyright © 2018 Amanda Savluchinske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // BUTTONS OUTLETS
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    // Functions
    
    func sendToScorePage() {
        self.performSegue(withIdentifier: "fromGameToSaveScreen", sender: self)
    }
    
    func setTitleAndTag(number: Int) {
        numberButton.setTitle(String(number), for: .normal)
        numberButton.tag = number
    }
    func resetScore() {
        numberButton.tag = 0
        numberButton.setTitle(String(0), for: .normal)
    }
    
    // ACTIONS
    
    @IBAction func unwindFromCancelButton(unwindSegue: UIStoryboardSegue) {
        resetScore()
    }
    
    
    // BUTTONS ACTIONS
    
    @IBAction func numberPress(_ sender: Any) {
        var currentValue: Int = numberButton.tag
        if currentValue == 100 {
            sendToScorePage()
        } else if currentValue == 0 {
            currentValue += 1
            setTitleAndTag(number: currentValue)
        } else if currentValue % 3 != 0 && currentValue % 5 != 0 {
            currentValue += 1
            setTitleAndTag(number: currentValue)
        } else {
            sendToScorePage()
        }
    }
    
    @IBAction func fizzPress(_ sender: Any) {
        var currentValue: Int = numberButton.tag
        if currentValue == 100 {
            sendToScorePage()
        } else if currentValue == 0 {
            sendToScorePage()
        } else if currentValue % 3 != 0 {
            sendToScorePage()
        } else if currentValue % 3 == 0 && currentValue % 5 == 0 {
            sendToScorePage()
        } else {
            currentValue += 1
            setTitleAndTag(number: currentValue)
        }
    }
    
    @IBAction func buzzPress(_ sender: Any) {
        var currentValue: Int = numberButton.tag
        if currentValue == 100 {
            sendToScorePage()
        } else if currentValue == 0 {
            sendToScorePage()
        } else if currentValue % 5 != 0 {
            sendToScorePage()
        } else if currentValue % 3 == 0 && currentValue % 5 == 0 {
            sendToScorePage()
        } else {
            currentValue += 1
            setTitleAndTag(number: currentValue)
        }
    }
    
    @IBAction func fizzBuzzPress(_ sender: Any) {
        var currentValue: Int = numberButton.tag
        if currentValue == 100 {
            sendToScorePage()
        } else if currentValue == 0 {
            sendToScorePage()
        } else if currentValue % 3 == 0 && currentValue % 5 == 0 {
            currentValue += 1
            setTitleAndTag(number: currentValue)
        } else {
            sendToScorePage()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SubmitVC = segue.destination as? SubmitViewController {
            SubmitVC.score = self.numberButton.tag
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

