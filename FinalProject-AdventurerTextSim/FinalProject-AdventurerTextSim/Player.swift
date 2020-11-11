//
//  Player.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 10/28/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation

class Player{
    private static var _shared:Player!
    
    static var shared:Player{
        if _shared==nil {
            _shared = Player()
            
        }
        return _shared
    }
    //player info never/rarely change
    private var playerName:String
    private var playerMaxHealth:Int
    private var playerLevel:Int
    private var playerClass:String // not used yet
    private var playerIsAlive:Bool
    private var playerlives:Int
    private var playerRespawnLocation:[Int]
    
    
    //player info change alot
    private var playerHealth:Int
    private var playerExperience:Int
    private var playerStamina:Int   // not used yet
    private var playerMana:Int   // not used yet
    
    
    //player inventory stuff
    private var playerInventory:[Item]
    private var playerWeapon:[Weapon]
    private var playerArmor:[Armor]
    private var playerGold:Int
    
    //player location
    private var playerX:Int
    private var playerY:Int
    
    
    
    private init(){
        playerHealth = 100
        playerName = ""
        playerStamina = 100
        playerMana = 100
        playerMaxHealth = 100
        playerLevel = 1
        playerExperience = 0
        playerInventory = []
        playerWeapon = [Fists.YourFists]
        playerArmor = []
        playerGold = 0
        playerClass = ""
        playerX = 0
        playerY = 0
        playerIsAlive = true
        playerlives = 3
        playerRespawnLocation = [0,0]
    }
    
    func setPlayerInfo(name:String,pClass:String,dificulty: String){
        
        playerName = name
        playerClass = pClass
        if dificulty == "Hard"{
            playerlives = 1
        }
        else{
            playerlives = 3
        }
        
    }
    //----------------------------------------------------------------------------------------
    //Location/Movement functions
    //----------------------------------------------------------------------------------------

    
    
    func getPlayerSpawnLocation()-> [Int]{
        return playerRespawnLocation
    }
    func setPlayerSpawnLocation(location: [Int]){
        playerRespawnLocation = location
    }
    func setlocation(x:Int, y:Int){
        playerX = x
        playerY = y
    }
    func getlocation()->[Int]{
        return [playerX,playerY]
    }
    
    
    func travel(direction:String){
        /*
         switch statement for all 8
         directions
         
         */
    }
    func moveX(num: Int){
        playerX += num
    }
    func moveY(num: Int){
        playerY += num
    }
    //----------------------------------------------------------------------------------------
    //Gold functions  
    //----------------------------------------------------------------------------------------

    
    
    func setPlayerGold(gold:Int){
        playerGold = gold
    }
    func getPlayerGold()-> Int{
        return playerGold
    }
    func increaseGold(gold:Int){
        playerGold += gold
    }
    func decreaseGold(gold:Int){
        playerGold -= gold
    }
    
    //----------------------------------------------------------------------------------------
    //Level/Xp functions
    //----------------------------------------------------------------------------------------

    
    
    func increasePlayerXP(xp: Int){
        playerExperience += xp
        playerLevelCheck()
    }
    func getPlayerLevel()->Int{
        return playerLevel
    }
    func playerLevelCheck(){
        /*
         case switch for current level and xp required for next level
         if requirement is met, playerLevelUp is called
         if not , the function ends there
         
         */
    }
    func playerLevelUp(){
        playerLevel += 1
        /*
         
         
         */
        playerLevelCheck()
        
    }
    //----------------------------------------------------------------------------------------
    //Health/Life functions functions
    //----------------------------------------------------------------------------------------
    
    
    func increaseHealth(num: Int){
        playerHealth += num
        if playerHealth > playerMaxHealth{
            playerHealth = playerMaxHealth
        }
    }
    func damagePlayer(dmg:Int){
        playerHealth -= dmg
        
    }
    func lifeUpdate(){
        if playerHealth <= 0{
            playerlives -= 1
            if playerlives == 0{
                playerIsAlive = false
            }
            else{
                respawn()
            }
        }
    }
    func lifeCheck()-> Bool{
        return playerIsAlive
    }
    func respawn(){
        playerHealth = playerMaxHealth
        let location = getPlayerSpawnLocation()
        setlocation(x: location[0], y: location[1])
        
    }
    
    
    
}

