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
        updatePlayerStats()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var outputLBL: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var healthLBL: UILabel!
    @IBOutlet weak var posLBL: UILabel!
    
    @IBOutlet weak var gold: UILabel!
    @IBAction func showHelp(_ sender: UIButton)
    {
        let alertController = UIAlertController(title:"Help!", message:"Welcome to AdventureSim! Type in commands to move, attack and more! For a list of commands, type \"commands\" and press submit. Good luck player!", preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        present(alertController, animated:true, completion:nil)
    }
    func updatePlayerStats() -> Void
    {
        healthLBL.text = "\(Player.shared.getCurrentHealth())/\(Player.shared.getMaxHealth())"
        posLBL.text = "\(Player.shared.getlocation())"
    }
    var monster:Creature = CreatureMaker.cMaker.getCreature("Mob")
    @IBAction func submitBTN(_ sender: Any)
    {
        var playerLocation:[Int] = Player.shared.getlocation()
       
        
        switch inputTF.text?.lowercased()
        {
        case "move north":
            if (playerLocation[1] == 0)
            {
                outputLBL.text = "You can't move further north."
                
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0], y: playerLocation[1]-1) == false)
            {
                outputLBL.text = "You can't move further north. \nThe water stops you."
                
                
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "north")
                outputLBL.text = "You move north."
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move north, a \(monster.getName()) is here."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: monster.getName())
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move north and find a town."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: "Town")
                }
                
            }
            if(Player.shared.isBattling()){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives())"
                    
                }
                
            }
        case "move east":
            if (playerLocation[0] == 24)
            {
                outputLBL.text = "You can't move further east."
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]+1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further east. \nThe water stops you."
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "east")
                outputLBL.text = "You move east."
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    // spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move east, a \(monster.getName()) is here."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: monster.getName())
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move east and find a town."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: "Town")
                }
            }
            if(Player.shared.isBattling()){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives())"
                    
                }
                
            }
        case "move south":
            if (playerLocation[1] == 24)
            {
                outputLBL.text = "You can't move further south."
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0], y: playerLocation[1]+1) == false)
            {
                outputLBL.text = "You can't move further south. The water continues off into the foreseeable distance."
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "south")
                outputLBL.text = "You move south."
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move south, a \(monster.getName()) is here."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: monster.getName())
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move south and find a town."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: "Town")
                }
            }
            if(Player.shared.isBattling()){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives())"
                    
                }
                
            }
        case "move west":
            if ((playerLocation[0] == 0))
            {
                outputLBL.text = "You can't move further west."
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]-1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further west. \nThe water stops you."
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "west")
                outputLBL.text = "You move west."
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move west, a \(monster.getName()) is here."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: monster.getName())
                    
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move west and find a town."
                    DiscoveryTracker.dtracker.addDiscovery(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], name: "Town")
                }
            }
            if(Player.shared.isBattling()){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives()) lives left"
                    
                }
                
            }
        case "attack":
            if(Player.shared.isBattling()){
                //player attack
                monster.damageCreature(num: Player.shared.getDamage())
                outputLBL.text = "You attack the \(monster.getName()) with your \(Player.shared.getWeapon().getName()) \nPlayer pos \(Player.shared.getlocation())"
                //health check monster
                if (monster.lifeCheck()){
                    //monster attack
                    Player.shared.damagePlayer(dmg: monster.getDamage())
                    // player life check
                    if(!Player.shared.lifeCheck()){
                        outputLBL.text = "You have died. \nYou Respawn at [12,12] with \(Player.shared.getLives())"
                        Player.shared.setBattle(bo: false)
                        Player.shared.lifeUpdate()
                        
                    
                    }
                    
                }
                else{
                    outputLBL.text = "You have slain a \(monster.getName())"
                    if monster.getName() == "Hydra"{
                        Player.shared.increaseGold(gold: 100)
                    }
                    else if monster.getName() == "Golem"{
                        Player.shared.increaseGold(gold: 50)
                    }
                    else{
                        Player.shared.increaseGold(gold: 25)
                    }
                    gold.text = String(Player.shared.getPlayerGold())
                }
            }
            else{
                outputLBL.text = "There is nothing to attack."
            }
        case "heal":
            if(Map.globalMap.getLocationInfo(xy: playerLocation) == "Town"){
                Player.shared.increaseHealth(num: 100)
                outputLBL.text = "The Town Priest heals you."
            }
            else if(Player.shared.isBattling()){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives()) lives left"
                    
                }
                
            }
            else{
                outputLBL.text = "There is nobody to heal you here.\nTry healing in a town."
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
            outputLBL.text = "Commands: move (direction), attack, heal."
        case "stop it":
            outputLBL.text = "Get some help!"
        case "easter egg":
            outputLBL.text = "No easter eggs to be found here ;) \n But what if there was? 🤔"
        default:
            outputLBL.text = "You cannot do that."
        }
        HistoryTracker.tracker.addHistory(x: Player.shared.getlocation()[0], y: Player.shared.getlocation()[1], input: String((inputTF.text)!), output: outputLBL.text!)
        updatePlayerStats()
    }
}
