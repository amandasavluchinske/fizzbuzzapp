//
//  SubmitViewController.swift
//  FizzBuzz
//
//  Created by Amanda Savluchinske on 01/08/2018.
//  Copyright © 2018 Amanda Savluchinske. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {
    
    // Data Var
    var score: Int?
    
    // Outlets
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    // Actions
    @IBAction func saveButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stringScore = "\(score ?? 0)"
        print(stringScore)
        
        scoreLabel.text = stringScore

        self.navigationItem.setHidesBackButton(true, animated:true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
