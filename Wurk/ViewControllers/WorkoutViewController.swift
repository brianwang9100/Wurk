//
//  WorkoutViewController.swift
//  Wurk
//
//  Created by Brian Wang on 6/15/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit


// This shows all of the routines for a workout
class WorkoutViewController: UIViewController {
    
    var workout: Workout!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = workout.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "RoutineSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RoutineSegue" {
            let dest = segue.destination as! RoutineViewController
            dest.workout = workout
            
            if let index = sender as? Int {
                let routines = workout.routinesDict.map({key, value in return value})
                let routine = routines[index]
                dest.routine = routine
            }
            
        }
    }

}

extension WorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.routinesDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineCell", for: indexPath) as! RoutineTableViewCell
        let routines = workout.routinesDict.map({key, value in return value})
        let routine = routines[indexPath.row]
        cell.nameLabel.text = routine.name
        cell.setRepsLabel.text = routine.setReps
        cell.weightLabel.text = routine.weight
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "RoutineSegue", sender: indexPath.row)
    }
}
