//
//  Creature.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 11/11/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation

class Creature{
    
    private var creatureName:String;
    private var creatureHealth: Int;
    private var creatureDamage: Int;
    private var creatureDrops: [Int];
    private var isAlive: Bool;
    private var creatureMaxHealth:Int;

    init(name: String, baseHealth:Int, baseDamage:Int, drops:[Int]){
        creatureName = name;
        creatureHealth = baseHealth;
        creatureMaxHealth = baseHealth
        creatureDamage = baseDamage;
        creatureDrops = drops;
        isAlive = true;
    }
    
    func modifyCreature(playerLevel: Int){
        for _ in 1...playerLevel{
            creatureHealth += creatureHealth/10;
            creatureMaxHealth = creatureHealth;
            creatureDamage += creatureDamage/20;
        }
        
    }
    func getDamage()->Int{
        return creatureDamage;
    }
    
    func damageCreature(num: Int){
        creatureHealth -= num;
        if creatureHealth <= 0{
            isAlive = false;
        }
    }
    func healCreature(num: Int){
        creatureHealth += num;
        if creatureHealth > creatureMaxHealth{
            creatureHealth = creatureMaxHealth;
        }
    }
    func lifeCheck()->Bool{
        return isAlive;
    }
    func getName()->String{
        return creatureName;
    }
    

}

struct CreatureMaker {
    private static var _cMaker:CreatureMaker!
    
    static var cMaker:CreatureMaker{
        if _cMaker==nil {
            _cMaker = CreatureMaker();
            
        }
        // add creatures to array here
        _cMaker.addCreature(it: Creature(name: "Hydra", baseHealth: 100, baseDamage: 20, drops:[]))
        _cMaker.addCreature(it: Creature(name: "Golem", baseHealth: 50, baseDamage: 15, drops:[]))
        _cMaker.addCreature(it: Creature(name: "Mob", baseHealth: 25, baseDamage: 10, drops:[]))
        return _cMaker
    }
    
    private var creatureArray:[Creature]
    
    private init(){
        creatureArray = [];
    }
    
    mutating func addCreature(it: Creature){
        creatureArray.append(it);
    }
    func getCreature(_ name: String)-> Creature{
        
        for crea in creatureArray{
            let creaName = crea.getName();
            if creaName == name{
                return crea
            }
        }
        return creatureArray[0];
    }
    
}
