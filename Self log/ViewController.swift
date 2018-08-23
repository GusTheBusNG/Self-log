//
//  ViewController.swift
//  Self log
//
//  Created by Nicholas Gustafson on 8/6/18.
//  Copyright © 2018 Nicholas Gustafson. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var currentValue: Int = 10
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel! 

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        
        currentValue = Int(roundedValue)

        switch roundedValue {
        case 0..<2:
            sliderLabel.text = "Wow, let's never do this again, seriously"
        case 2..<4:
            sliderLabel.text = "Well, this is alright. But definitely not preferred"
        case 4..<6:
            sliderLabel.text = "I would not mind doing this for long periods of time"
        case 6..<8:
            sliderLabel.text = "I'm genuinely happy doing this"
        case 8...10:
            sliderLabel.text = "I want to continue doing this for the rest of my life! 😁"
        default:
            sliderLabel.text = "I want to continue doing this for the rest of my life! 😁"
        }
    }
    
    @IBAction func saveButtonPressed() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Rating", in: managedContext)!
        
        let rating = NSManagedObject(entity: entity, insertInto: managedContext)
        
        rating.setValue(currentValue, forKeyPath: "score")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save rating value. \(error), \(error.userInfo)")
        }
    }
}

