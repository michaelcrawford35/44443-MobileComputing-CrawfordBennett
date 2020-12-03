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
    @IBAction func submitBTN(_ sender: Any)
    {
        switch outputLBL.text?.lowercased()
        {
        case "move":
            Player.shared.travel(direction: "north")
            outputLBL.text = "You move north. Player pos \(Player.shared.getlocation())"
        default:
            outputLBL.text = "You cannot do that."
        }
    }
}
