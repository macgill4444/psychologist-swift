//
//  ViewController.swift
//  Psychologist
//
//  Created by Macgill Davis on 8/27/15.
//  Copyright (c) 2015 Macgill Davis. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    
    @IBAction func nothing(sender: UIButton) {
        //sender could be self, sender, or nil
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Show Sad Face": hvc.happiness = 5
                case "Show Meh Face": hvc.happiness = 52
                case "Show Happy Face": hvc.happiness = 95
                case "nothing": hvc.happiness = 25
                default:break
                }
            }
        }
    }

}

