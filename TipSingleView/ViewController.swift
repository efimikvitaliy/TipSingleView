//
//  ViewController.swift
//  TipSingleView
//
//  Created by efimikvitaliy on 17.10.15.
//  Copyright (c) 2015 DreamTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addRestarauntButton: UIButton!
    
    @IBOutlet weak var ratingLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var siderRating: UISlider!
    
    @IBOutlet weak var impSlider: UISlider!
    @IBOutlet weak var showTipButton: UIButton!
    struct Restaraunt {
        
        var name: String
        var address: String
        var raiting: Float
        
        func simpleDescription() -> String {
            return "\(name) is based at address \(address). And it has raiting = \(raiting) "
        }
        
    }
    
    @IBAction func impressionChanged(sender: AnyObject) {
        var currVal = impSlider.value
        
        impressionTip.text = "\(currVal)"
        
    }
    @IBAction func sliderValChanged(sender: AnyObject) {
        
        var currVal = siderRating.value
        
        ratingLabel.text = "\(currVal)"
        
        
    }
    var restarauntDict = [String: Restaraunt]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sumTip: UITextField!
    @IBOutlet weak var impressionTip: UITextField!
    @IBOutlet weak var nameTip: UITextField!
    @IBOutlet weak var recTip: UILabel!
    @IBAction func executeTip(sender: AnyObject) {
        
        var name: String = nameTip.text
        //name = name.substringToIndex(name.endIndex.predecessor())
        
        var tmpRestaurant = restarauntDict[name]
        if let currentRestaurant = tmpRestaurant {
            
           // print("enter summ in check ")
            var sum: Float = NSString(string: sumTip.text).floatValue
            
            //print("enter impression from 1 to 10 ")
            var impression: Float = NSString(string: impressionTip.text).floatValue
            
            var tipReccomendation = sum*0.01 + currentRestaurant.raiting*0.5 + impression*0.5;
            
            
            //print("Tip reccomendation is \(tipReccomendation)")
            recTip.text = tipReccomendation.description
        }
        else {
            recTip.text = "no restaraunt in db"
        }
        
        
    }

    @IBAction func addRestarauntTouch(sender: AnyObject) {
        var name: String = nameLabel.text
        var address: String = addressLabel.text
        var rating: Float = NSString(string: ratingLabel.text).floatValue
        restarauntDict[name] = Restaraunt(name: name,address: address, raiting: rating)

        for (name, rest) in restarauntDict
        {
            println(rest.simpleDescription())
        }
        let alertController = UIAlertController(title: "Restaraunt", message:
            "Restaraunt added", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}