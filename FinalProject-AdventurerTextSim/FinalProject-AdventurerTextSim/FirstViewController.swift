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
    
    @IBAction func showHelp(_ sender: UIButton)
    {
        let alertController = UIAlertController(title:"Help!", message:"Welcome to AdventureSim! Type in commands to move, attack and more! For a list of commands, type \"commands\" and press submit. Good luck player!", preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        present(alertController, animated:true, completion:nil)
    }
    
    @IBAction func submitBTN(_ sender: Any)
    {
        var playerLocation:[Int] = Player.shared.getlocation()
        switch inputTF.text?.lowercased()
        {
        case "move north":
            if (playerLocation[1] == 0)
            {
                outputLBL.text = "You can't move further north. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0], y: playerLocation[1]-1) == false)
            {
                outputLBL.text = "You can't move further north. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.travel(direction: "north")
                outputLBL.text = "You move north. \nPlayer pos \(Player.shared.getlocation())"
            }
        case "move east":
            if (playerLocation[0] == 24)
            {
                outputLBL.text = "You can't move further east. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]+1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further east. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.travel(direction: "east")
                outputLBL.text = "You move east. \nPlayer pos \(Player.shared.getlocation())"
            }
        case "move south":
            if (playerLocation[1] == 24)
            {
                outputLBL.text = "You can't move further south. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0], y: playerLocation[1]+1) == false)
            {
                outputLBL.text = "You can't move further south. The water continues off into the foreseeable distance. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.travel(direction: "south")
                outputLBL.text = "You move south. \nPlayer pos \(Player.shared.getlocation())"
            }
        case "move west":
            if ((playerLocation[0] == 0))
            {
                outputLBL.text = "You can't move further west. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]-1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further west. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.travel(direction: "west")
                outputLBL.text = "You move west. \nPlayer pos \(Player.shared.getlocation())"
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
        case "commands":
            outputLBL.text = "Commands: move (direction), attack."
        case "stop it":
            outputLBL.text = "Get some help!"
        case "easter egg":
            outputLBL.text = "No easter eggs to be found here ;) \n But what if there was? 🤔"
        default:
            outputLBL.text = "You cannot do that."
        }
        HistoryTracker.tracker.addHistory(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], input: String((inputTF.text)!), output: outputLBL.text!)
    }
}
