//
//  ThirdViewTableViewController.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 12/3/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import UIKit

class ThirdViewTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return HistoryTracker.tracker.counter
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell",for: indexPath) as! ThirdTableViewCell
        if(HistoryTracker.tracker.counter > 0){
            cell.Input.text = HistoryTracker.tracker.array[indexPath.row][2]
            cell.output.text = HistoryTracker.tracker.array[indexPath.row][3]
            cell.xy.text = "\(HistoryTracker.tracker.array[indexPath.row][0]) , \(HistoryTracker.tracker.array[indexPath.row][1])"
        }
        return cell
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.tableView.reloadData()
    }
}
