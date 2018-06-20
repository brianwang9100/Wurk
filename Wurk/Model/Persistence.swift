//
//  Persistence.swift
//  Wurk
//
//  Created by Brian Wang on 6/15/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit

let WORKOUTS_KEY = "WORKOUTS_KEY"

struct Persistence {
    static func loadWorkoutsDict() -> [String: Workout] {
        if let workoutsDict = UserDefaults.standard.dictionary(forKey: WORKOUTS_KEY) as? [String: Workout] {
            return workoutsDict
        }
        return [:]
    }
    static func loadWorkouts() -> [Workout] {
        let workoutsDict = loadWorkoutsDict()
        return workoutsDict.map({key, value in return value})
    }
    
    static func save(workout: Workout) {
        var workoutsDict = loadWorkoutsDict()
        workoutsDict[workout.name] = workout
        UserDefaults.standard.set(workoutsDict, forKey: WORKOUTS_KEY)
    }
}
