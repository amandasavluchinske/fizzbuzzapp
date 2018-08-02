//
//  ScoreTableViewController.swift
//  FizzBuzz
//
//  Created by Amanda Savluchinske on 01/08/2018.
//  Copyright © 2018 Amanda Savluchinske. All rights reserved.
//

import UIKit
import CoreData

class ScoreTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var people: [NSManagedObject] = []
    
    func fetchPeople() {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            try self.people = (self.context!.fetch(request))
            print(people)
            self.tableView.reloadData()
        } catch let error as NSError {
            print("Error retrieving people")
        }
    }
    
    
    // Actions
    
    
//    @IBAction func unwindToGame(_ sender: Any) {
//        self.performSegue(withIdentifier: "scoreToGame", sender: self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.context = self.appDelegate?.persistentContainer.viewContext
        
        fetchPeople()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath) as? PersonTableViewCell else {
                fatalError("Nope")
                
        }
        let person = self.people[indexPath.row]
        let name = person.value(forKey: "name") as? String
        let score = person.value(forKey: "score") as? Int
        let stringScore = "\(score ?? 0)"
        let image = person.value(forKey: "image") as? Data
        cell.namePerson.text = name
        cell.scorePerson.text = stringScore
        cell.imagePerson.image = UIImage(data: image!, scale: 1.0)
        return cell
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let person = self.people[indexPath.row]
            self.context?.delete(person)
            self.appDelegate?.saveContext()
            
            let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
            do {
                try self.people = (self.context?.fetch(request))!
                tableView.reloadData()
            } catch {
                print("fetching failed")
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
