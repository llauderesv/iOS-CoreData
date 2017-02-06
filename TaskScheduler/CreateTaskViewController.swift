//
//  CreateTaskViewController.swift
//  TaskScheduler
//
//  Created by Orange Apps on 06/02/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet var txtFieldTask: UITextField!
    @IBOutlet var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        // Initialize the coredata object
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Initialize the task class and add a property
        let task = Task(context: context)
        task.name = txtFieldTask.text
        task.important = importantSwitch.isOn
        // Save the data in the database
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Moves back to the view controller
        navigationController!.popViewController(animated: true)
        
    }

}
