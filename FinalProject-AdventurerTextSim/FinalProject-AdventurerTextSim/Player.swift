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
    private var inBattle:Bool
    
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
        playerX = 12
        playerY = 12
        playerIsAlive = true
        playerlives = 3
        playerRespawnLocation = [12,12]
        inBattle = false;
    }
    
    func setPlayerInfo(name:String,pClass:String,difficulty: String){
        
        playerName = name
        playerClass = pClass
        if difficulty == "Hard"{
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
        switch direction{
        case "north":
            moveY(num: -1)
        case "east":
            moveX(num: 1)
        case "south":
            moveY(num: 1)
        case "west":
            moveX(num: -1)
        case "northeast":
            moveY(num: -1)
            moveX(num: 1)
        case "northwest":
            moveY(num: -1)
            moveX(num: -1)
        case "southeast":
            moveY(num: 1)
            moveX(num: 1)
        case "southwest":
            moveY(num: 1)
            moveX(num: -1)
        default:
            print("ERROR MOVING PLAYER")
        }
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
        if playerHealth <= 0{
            playerIsAlive = false 
        }
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
    func getLives()->Int{
        return playerlives
    }
    func lifeCheck()-> Bool{
        return playerIsAlive
    }
    func respawn(){
        playerHealth = playerMaxHealth
        let location = getPlayerSpawnLocation()
        setlocation(x: location[0], y: location[1])
        
    }
    //----------------------------------------------------------------------------------------
    //Battle functions functions
    //----------------------------------------------------------------------------------------
    
    func isBattling()-> Bool{
        return inBattle
    }
    
    func setBattle(bo:Bool){
        inBattle = bo
    }
    func getDamage()->Int{
        return playerWeapon[0].getDamage()
    }
    func getWeapon()-> Weapon{
        return playerWeapon[0]
    }
}

