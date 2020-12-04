//
//  SecondViewController.swift
//  FinalProject-AdventurerTextSim
//
//  Created by student on 10/26/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func helpBTN(_ sender: UIButton)
    {
        let alertController = UIAlertController(title:"Help!", message:"This is the discoveries tab. Here, you can see the locations and monsters you have encountered and more detailed information about them!", preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        present(alertController, animated:true, completion:nil)
    }
}
