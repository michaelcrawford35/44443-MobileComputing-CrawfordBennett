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
    
    
    @IBOutlet weak var gold: UILabel!
    @IBAction func showHelp(_ sender: UIButton)
    {
        let alertController = UIAlertController(title:"Help!", message:"Welcome to AdventureSim! Type in commands to move, attack and more! For a list of commands, type \"commands\" and press submit. Good luck player!", preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title:"OK", style:UIAlertAction.Style.default, handler:nil))
        present(alertController, animated:true, completion:nil)
    }
    var monster:Creature = CreatureMaker.cMaker.getCreature("Mob")
    @IBAction func submitBTN(_ sender: Any)
    {
        var playerLocation:[Int] = Player.shared.getlocation()
        var battling:Bool = Player.shared.isBattling()
        
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
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "north")
                outputLBL.text = "You move north. \nPlayer pos \(Player.shared.getlocation())"
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move east, a \(monster.getName()) is here. \nPlayer pos \(Player.shared.getlocation())"
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move east and find a town. \nPlayer pos \(Player.shared.getlocation())"
                }
                
            }
            if(battling){
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
                outputLBL.text = "You can't move further east. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]+1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further east. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "east")
                outputLBL.text = "You move east. \nPlayer pos \(Player.shared.getlocation())"
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    // spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move east, a \(monster.getName()) is here. \nPlayer pos \(Player.shared.getlocation())"
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move east and find a town. \nPlayer pos \(Player.shared.getlocation())"
                }
            }
            if(battling){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives())"
                    
                }
                
            }
        case "move south":
            print(Map.globalMap.canTraverse(x: playerLocation[0], y: playerLocation[1]+1))
            print(playerLocation[0])
            print(playerLocation[1])
            print(playerLocation[1]+1)
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
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "south")
                outputLBL.text = "You move south. \nPlayer pos \(Player.shared.getlocation())"
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move south, a \(monster.getName()) is here. \nPlayer pos \(Player.shared.getlocation())"
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move east and find a town. \nPlayer pos \(Player.shared.getlocation())"
                }
            }
            if(battling){
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
                outputLBL.text = "You can't move further west. \nPlayer pos \(Player.shared.getlocation())"
            }
            else if (Map.globalMap.canTraverse(x: playerLocation[0]-1, y: playerLocation[1]) == false)
            {
                outputLBL.text = "You can't move further west. \nThe water stops you. \nPlayer pos \(Player.shared.getlocation())"
            }
            else
            {
                Player.shared.setBattle(bo: false)
                Player.shared.travel(direction: "west")
                outputLBL.text = "You move west. \nPlayer pos \(Player.shared.getlocation())"
                
                if(Map.globalMap.monsterHere(xy: Player.shared.getlocation())){
                    Player.shared.setBattle(bo: true)
                    //Spawn monster
                    monster = CreatureMaker.cMaker.getCreature(Map.globalMap.getLocationInfo(xy: Player.shared.getlocation()))
                    outputLBL.text = "You move west, a \(monster.getName()) is here. \nPlayer pos \(Player.shared.getlocation())"
                    
                }
                else if(Map.globalMap.townHere(xy: Player.shared.getlocation())){
                    outputLBL.text = "You move east and find a town. \nPlayer pos \(Player.shared.getlocation())"
                }
            }
            if(battling){
                //monster attack
                Player.shared.damagePlayer(dmg: monster.getDamage())
                // player life check
                if(!Player.shared.lifeCheck()){
                    Player.shared.lifeUpdate()
                    outputLBL.text = "You have died. \nYou Respawn at\(Player.shared.getlocation()) with \(Player.shared.getLives()) lives left"
                    
                }
                
            }
        case "attack":
            if(battling){
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
                    outputLBL.text = "You have slain a \(monster.getName()) \nPlayer pos \(Player.shared.getlocation())"
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
                outputLBL.text = "There is nothing to attack \nPlayer pos \(Player.shared.getlocation())"
            }
        case "heal":
            if(Map.globalMap.getLocationInfo(xy: playerLocation) == "Town"){
                Player.shared.increaseHealth(num: 100)
                outputLBL.text = "The Town Priest Heals you \nPlayer pos \(Player.shared.getlocation())"
            }
            else{
                outputLBL.text = "There is nobody to heal you here \nPlayer pos \(Player.shared.getlocation()) \nTry healing in town"
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
