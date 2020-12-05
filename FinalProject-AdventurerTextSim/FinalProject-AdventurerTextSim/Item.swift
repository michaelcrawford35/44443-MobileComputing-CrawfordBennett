//
//  Item.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 11/11/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation

//----------------------------------------------------------------------------------------
//Item class and sub classes
//----------------------------------------------------------------------------------------

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
    func getName()->String{
        return itemName
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
//----------------------------------------------------------------------------------------
//subclasses of Weapon Class
//----------------------------------------------------------------------------------------


class Sword:Weapon{
    private static var _Excaliber:Sword!
    static var Excaliber:Sword{
        if _Excaliber == nil {
            _Excaliber = Sword(name:"Excaliber",rarity: "Legendary",value: 10000,damage: 20,stamCost: 1, durability: 1,weapType: "Sword",descript: "This legendary sword has a habit of finding great heroes **Wink")
        }
        return _Excaliber
    }
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
            _YourFists = Fists(name:"Fists",rarity: "Common",value: 0,damage: 5,stamCost: 1, durability: 1,weapType: "Fists",descript: "You see them daily, do they really need explained")
        }
        return _YourFists
    }
    override init(name:String,rarity:String,value:Int,damage:Int,stamCost:Int,durability:Int,weapType:String,descript:String){
        super.init(name:name,rarity:rarity,value:value,damage:damage,stamCost:stamCost,durability:durability,weapType:"Fist",descript:descript)
        
    }
    
    
}

