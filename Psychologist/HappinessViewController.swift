//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Macgill Davis on 8/26/15.
//  Copyright (c) 2015 Macgill Davis. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var happiness: Int = 50 { //0 is very sad and 100 is ectastic
        didSet {
            happiness = min(max(happiness,0), 100)
//            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "Happiness level = \(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
    
}
