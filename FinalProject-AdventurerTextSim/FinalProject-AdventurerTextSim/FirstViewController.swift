//
//  FirstViewController.swift
//  FinalProject-AdventurerTextSim
//
//  Created by student on 10/26/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var outputLBL: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBAction func submitBTN(_ sender: Any)
    {
        var playerLocation:[Int] = Player.shared.getlocation()
        switch inputTF.text?.lowercased()
        {
        case "move north":
            if (playerLocation[1] == 0)
            {
                outputLBL.text = "You can't move further north. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else if ((playerLocation[0] == 0 && playerLocation[1] == 5) || (playerLocation[0] == 1 && playerLocation[1] == 4) || (playerLocation[0] == 2 && playerLocation[1] == 3) || (playerLocation[0] == 3 && playerLocation[1] == 2) || (playerLocation[0] == 4 && playerLocation[1] == 1))
            {
                outputLBL.text = "You can't move further north. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else
            {
                Player.shared.travel(direction: "north")
                outputLBL.text = "You move north. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
        case "move east":
            if (playerLocation[0] == 24)
            {
                outputLBL.text = "You can't move further east. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else
            {
                Player.shared.travel(direction: "north")
                outputLBL.text = "You move east. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
        case "move south":
            if (playerLocation[1] == 21)
            {
                outputLBL.text = "You can't move further south. The water continues off into the foreseeable distance. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else
            {
                Player.shared.travel(direction: "south")
                outputLBL.text = "You move south. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
        case "move west":
            if ((playerLocation[0] == 0))
            {
                outputLBL.text = "You can't move further west. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else if ((playerLocation[0] == 1 && playerLocation[1] == 4) || (playerLocation[0] == 2 && playerLocation[1] == 3) || (playerLocation[0] == 3 && playerLocation[1] == 2) || (playerLocation[0] == 4 && playerLocation[1] == 1) || (playerLocation[0] == 5 && playerLocation[1] == 0))
            {
                outputLBL.text = "You can't move further west. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
            else
            {
                Player.shared.travel(direction: "west")
                outputLBL.text = "You move west. \nPlayer pos \(Player.shared.getlocation())"
                
                HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
            }
        /*case "move northeast":
            Player.shared.travel(direction: "northeast")
            outputLBL.text = "You move northeast. Player pos \(Player.shared.getlocation())"
        case "move northwest":
            Player.shared.travel(direction: "northwest")
            outputLBL.text = "You move northwest. Player pos \(Player.shared.getlocation())"
        case "move southeast":
            Player.shared.travel(direction: "southeast")
            outputLBL.text = "You move southeast. Player pos \(Player.shared.getlocation())"
        case "move southwest":
            Player.shared.travel(direction: "southwest")
            outputLBL.text = "You move southwest. Player pos \(Player.shared.getlocation())"*/
        default:
            outputLBL.text = "You cannot do that."
            
            HistoryTracker.tracker.addHistory(x: playerLocation[0], y: playerLocation[1], input: String((inputTF.text)!), output: outputLBL.text!)
        }
    }
}
