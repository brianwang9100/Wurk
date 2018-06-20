//
//  ViewController.swift
//  Wurk
//
//  Created by Brian Wang on 6/15/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit

// this allows you to select your workouts
class SelectViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var workouts: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        loadWorkouts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWorkouts() {
        workouts = Persistence.loadWorkouts()
        tableView.reloadData()
    }

    @IBAction func addWorkout(_ sender: Any) {
        let alertController = UIAlertController(title: "New Workout", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert in
            let workoutNameTextField = alertController.textFields![0]
            if let name = workoutNameTextField.text {
                let newWorkout = Workout(name: name, routinesDict: [:])
                Persistence.save(workout: newWorkout)
                self.loadWorkouts()
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Workout Name"
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? Int, segue.identifier == "WorkoutSegue" {
            let dest = segue.destination as! WorkoutViewController
            dest.workout = workouts[index]
        }
    }
    
}


extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutTableViewCell
        let workout = workouts[indexPath.row]
        cell.nameLabel.text = workout.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "WorkoutSegue", sender: indexPath.row)
    }
}
