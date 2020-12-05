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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func helpBTN(_ sender: UIButton)
    {
        let alertController = UIAlertController(title:"Help!", message:"This is the discoveries tab. Here, you can see the locations and monsters you have encountered and more detailed information about them!", preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        present(alertController, animated:true, completion:nil)
    }
}
extension SecondViewController: UITableViewDelegate{
    
    
    
}

extension SecondViewController: UITableViewDataSource{
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return DiscoveryTracker.dtracker.counter
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dCell",for: indexPath)
            if(DiscoveryTracker.dtracker.counter > 0){
                cell.textLabel?.text = DiscoveryTracker.dtracker.array[indexPath.row][2]
                cell.detailTextLabel?.text = "Location: [\(DiscoveryTracker.dtracker.array[indexPath.row][0]),\(DiscoveryTracker.dtracker.array[indexPath.row][1])]"
            }
            return cell
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    

