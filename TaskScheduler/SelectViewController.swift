//
//  SelectViewController.swift
//  TaskScheduler
//
//  Created by Orange Apps on 06/02/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet var lblTask: UILabel!
    var tasks: Task? = nil
    //var task: Tas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the task
        /**/
        if tasks!.important {
            lblTask.text = "❗️\(tasks!.name!)"
        } else {
            lblTask.text = tasks!.name!
        }
        
        
    }
    
    @IBAction func btnCompleteTask(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(tasks!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
        
        // Moves back to the view controller
        navigationController!.popViewController(animated: true)
    }
    
}
