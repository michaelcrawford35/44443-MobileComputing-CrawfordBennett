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
        default:
            outputLBL.text = "You cannot do that."
        }
    }
}
