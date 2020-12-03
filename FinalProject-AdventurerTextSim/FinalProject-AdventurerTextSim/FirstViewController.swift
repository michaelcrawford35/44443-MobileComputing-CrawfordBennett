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
        switch inputTF.text?.lowercased()
        {
        case "move north":
            Player.shared.travel(direction: "north")
            outputLBL.text = "You move north. Player pos \(Player.shared.getlocation())"
        case "move east":
            Player.shared.travel(direction: "east")
            outputLBL.text = "You move east. Player pos \(Player.shared.getlocation())"
        case "move south":
            Player.shared.travel(direction: "south")
            outputLBL.text = "You move south. Player pos \(Player.shared.getlocation())"
        case "move west":
            Player.shared.travel(direction: "west")
            outputLBL.text = "You move west. Player pos \(Player.shared.getlocation())"
        case "move northeast":
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
            outputLBL.text = "You move southwest. Player pos \(Player.shared.getlocation())"
        default:
            outputLBL.text = "You cannot do that."
        }
    }
}
