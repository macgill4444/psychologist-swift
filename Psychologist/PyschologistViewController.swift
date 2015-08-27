//
//  ViewController.swift
//  Psychologist
//
//  Created by Macgill Davis on 8/27/15.
//  Copyright (c) 2015 Macgill Davis. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
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
                default:break
                }
            }
        }
    }

}

