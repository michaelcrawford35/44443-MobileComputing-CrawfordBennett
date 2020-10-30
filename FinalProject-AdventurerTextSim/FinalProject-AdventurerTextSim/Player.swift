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
    private var playerClass:String
    
    //player info change alot
    private var playerHealth:Int
    private var playerExperience:Int
    private var playerStamina:Int
    private var playerMana:Int
    
    
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
        
    }
    
    func setPlayerInfo(name:String,pClass:String){
        playerName = name
        playerClass = pClass
        
    }
    func damagePlayer(dmg:Int){
        playerHealth -= dmg
        
    }
    func travel(direction:String){
        /*
         switch statement for all 8
         directions
         
         */
    }
    func getlocation()->[Int]{
        return [playerX,playerY]
        
    }
    
    
    
}
class Item{
    private var itemName:String
    private var itemType:String
    private var itemRarity:String
    private var itemValue: Int
    private var itemDescription:String
    
    init(name:String,type:String,rarity:String,value:Int,descript:String){
        itemName = name
        itemType = type
        itemRarity = rarity
        itemValue = value
        itemDescription = descript
    }
    
}
class Weapon: Item{
    
    private var weaponDmg:Int
    private var weaponStamCost:Int
    private var weaponDurability: Int
    private var weaponType:String
    
    init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,descript:String){
        weaponDmg = damage
        weaponStamCost = stamCost
        weaponDurability = durability
        weaponType = weapType
        super.init(name:name,type:"Weapon",rarity:rarity,value:value,descript:descript)
        
        
    }
    
    func getDamage()->Int{
        return self.weaponDmg
    }
    func getStamCost()->Int{
        return self.weaponStamCost
    }
    func getDurability()->Int{
        return self.weaponDurability
    }
    func damageWeapon(num:Int){
        weaponDurability -= num
    }
    func repairDura(){
        self.weaponDurability = 100
    }
    func getWeaponType()->String{
        return self.weaponType
    }
    
}
class Armor: Item{
    private var armorDefense:Int
    private var armorWeight:Int
    private var armorDurability: Int
    
    init(name:String,rarity:String,value:Int,defense:Int,weight:Int,durability:Int,descript:String) {
        armorDefense = defense
        armorWeight = weight
        armorDurability = durability
        super.init(name:name,type:"Armor",rarity:rarity,value:value,descript:descript)
        
        
    }
    func getDurability()->Int{
        return self.armorDurability
    }
    func getWeight()->Int{
        return self.armorWeight
    }
    func getDefense()->Int{
        return self.armorDefense
    }
    
}
class Sword:Weapon{
    
    override init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,descript:String){
        super.init(name:name,rarity:rarity,value:value,damage:damage,stamCost:stamCost,durability:durability,weapType:"Sword",descript:descript)
    }
    
}
class Bow: Weapon {
    
    override init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,descript:String){
        super.init(name:name,rarity:rarity,value:value,damage:damage,stamCost:stamCost,durability:durability,weapType:"Bow",descript:descript)
    }
    
}
class Staff: Weapon{
    
    private var manaCost:Int
    
    init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,manaUse:Int,descript:String){
       manaCost = manaUse
        super.init(name:name,rarity:rarity,value:value,damage:damage,stamCost:stamCost,durability:durability,weapType:"Staff",descript:descript)
        
    }
    
    func getManaCost()->Int{
        return self.manaCost
    }
    
}
class Fists: Weapon{
    private static var _YourFists:Fists!
    static var YourFists:Fists{
        if _YourFists == nil {
            _YourFists = Fists(name:"My Fists",rarity: "Common",value: 0,damage: 1,stamCost: 1, durability: 1,weapType: "Fists",descript: "You see them daily, do they really need explained")
        }
        return _YourFists
    }
    override init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,descript:String){
        super.init(name:name,rarity:rarity,value:value,damage:damage,stamCost:stamCost,durability:durability,weapType:"Fist",descript:descript)
        
    }
    
    
}

