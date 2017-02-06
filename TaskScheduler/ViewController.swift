//
//  ViewController.swift
//  TaskScheduler
//
//  Created by Orange Apps on 06/02/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tblView: UITableView!
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Connect the table to the delegate and datasource
        tblView.delegate = self
        tblView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tblView.reloadData()
    }
    
    // Setup the number of rows in side the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Setup the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblViewCell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        // Determine if the task is important then add exclamation mark
        if task.important {
            tblViewCell.textLabel?.text = "❗️\(task.name!)"
        } else {
            tblViewCell.textLabel?.text = "\(task.name!)"
        }
        return tblViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
    
    // Create task
    @IBAction func createTask(_ sender: Any) {
        performSegue(withIdentifier: "createTask", sender: nil)
    }
    
    func getTask() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }catch {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTask" {
            // Make a reference from the other view controller
            let nextVC = segue.destination as!
            SelectViewController
            nextVC.tasks = sender as? Task
        }
    }
    
    
    
}

