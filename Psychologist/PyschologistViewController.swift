//
//  ViewController.swift
//  Psychologist
//
//  Created by Macgill Davis on 8/27/15.
//  Copyright (c) 2015 Macgill Davis. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "enter": hvc.happiness = setHappiness()
                default:break
                }
            }
        }
    }
    
    var dreams: [String] = ["Duncan the Doge", "Winter", "Another ham sandwich", "Nothing", "Cheese", "A Million Bucks", "The Sox"]
    
    
    @IBOutlet weak var dreamPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.dreamPicker.delegate = self
        self.dreamPicker.dataSource = self
        
    }

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dreams.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dreams[row]
    }
    
    
    @IBAction func enterDream() {
        performSegueWithIdentifier("enter", sender: nil)
    }
    
    func setHappiness() -> Int {
        if let selectedRow = dreamPicker?.selectedRowInComponent(0) {
            if let selectedDream = self.pickerView(dreamPicker, titleForRow: selectedRow, forComponent: 0) {
                println("\(selectedDream)")
                switch selectedDream {
                case "Duncan the Doge":
                    return 100
                case "Winter":
                    return 5
                case "Another ham sandwich":
                    return 53
                case "Nothing":
                    return 48
                case "Cheese":
                    return 95
                case "A Million Bucks":
                    return 88
                case "The Sox":
                    return 0
                default:break
                }
            }
        }
        return 50
    }
    

}

