//
//  RoutineViewController.swift
//  Wurk
//
//  Created by Brian Wang on 6/15/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit

// This shows information about a routine
class RoutineViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setRepsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    var workout: Workout!
    var routine: Routine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Routine"
        
        if let routine = routine {
            navigationItem.title = routine.name
            nameTextField.text = routine.name
            setRepsTextField.text = routine.setreps
            weightTextField.text = routine.weight
            notesTextView.text = routine.notes
            
            nameTextField.isEnabled = false // don't want to change name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if !nameTextField.text!.isEmpty
            && !setRepsTextField.text!.isEmpty
            && !weightTextField.text!.isEmpty {
            
            if routine == nil {
                let managedContext = Persistence.persistentContainer.viewContext
                routine = Routine(context: managedContext)
                routine.name = nameTextField.text
                routine.workout = workout
                
                let gradient = Gradient.random()
                routine.topColorHexString = gradient.topColorHexString
                routine.bottomColorHexString = gradient.bottomColorHexString
            }
            
            routine.setreps = setRepsTextField.text
            routine.weight = weightTextField.text
            routine.notes = notesTextView.text
            
            Persistence.saveContext()
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)   
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
