//
//  SubmitViewController.swift
//  FizzBuzz
//
//  Created by Amanda Savluchinske on 01/08/2018.
//  Copyright © 2018 Amanda Savluchinske. All rights reserved.
//

import UIKit
import CoreData

class SubmitViewController: UIViewController {
    
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var people: [NSManagedObject] = []
    
    // Data Var
    var score: Int?
    
    // Outlets
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    // Actions
    
    // Functions
    
    func save(name: String, score: Int, img: Data) {
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: self.context!)
        
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(name, forKey: "name")
        person.setValue(score, forKey: "score")
        person.setValue(img, forKey: "image")
        
        do {
            try context?.save()
            self.people.append(person)
            self.performSegue(withIdentifier: "saveToScores", sender: self)
        } catch let error as NSError {
            print("error")
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if inputName.text == nil || self.imageDisplay.image == nil || inputName.text == "" {
            let alert = UIAlertController(title: "Empty score", message: "You can't save an empty score.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
            
            self.present(alert, animated: true)
        } else {
            let name = inputName.text
            let img = self.imageDisplay.image
            let imgData = UIImageJPEGRepresentation(img!, 1)
            save(name: name!, score: score!, img: imgData!)
        }
    }
    
    @IBAction func submitImageButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.context = self.appDelegate?.persistentContainer.viewContext
        
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

extension SubmitViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let selectedImage = pickedImage
            self.imageDisplay.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
