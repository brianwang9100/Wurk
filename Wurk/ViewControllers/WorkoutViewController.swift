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
    
    @IBOutlet weak var tableView: UITableView!
    var workout: Workout!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        self.navigationItem.title = workout.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshViews()
    }
    
    func refreshViews() {
        Persistence.refreshAll()
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "RoutineSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RoutineSegue" {
            let dest = segue.destination as! RoutineViewController
            dest.workout = workout
            
            if let index = sender as? Int {
                let routines: [Routine] = workout.routines?.array as? [Routine] ?? []
                let routine = routines[index]
                dest.routine = routine
            }
            
        }
    }

}

extension WorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let routines: [Routine] = workout.routines?.array as? [Routine] ?? []
        return routines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineCell", for: indexPath) as! RoutineTableViewCell
        
        let routines: [Routine] = workout.routines?.array as? [Routine] ?? []
        let routine = routines[indexPath.row]
        cell.nameLabel.text = routine.name
        cell.setRepsLabel.text = routine.setreps
        cell.weightLabel.text = routine.weight
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "RoutineSegue", sender: indexPath.row)
    }
}
