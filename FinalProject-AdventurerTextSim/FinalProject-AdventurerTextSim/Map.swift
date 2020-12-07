//
//  Map.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 11/16/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation

struct Map
{
    private static var _globalMap:Map!
    
    enum MapTile:String {case empty = "Empty", town = "Town", water = "Water", mob = "Mob", golem = "Golem", hydra = "Hydra"}
    
    static var globalMap:Map
    {
        if _globalMap==nil {
            _globalMap = Map()
            
        }
        return _globalMap
    }
    
    // Map tiles stored here
    private var TheMapArray:[[MapTile]] =
        [
        /*0*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*1*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*2*/[MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water],
        /*3*/[MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.water, MapTile.water],
        /*4*/[MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water],
        /*5*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*6*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*7*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*8*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*9*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*10*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*11*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*12*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water],
        /*13*/[MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*14*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*15*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*16*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*17*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*18*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*19*/[MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*20*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*21*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*22*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*23*/[MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*24*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water]
        ]
    
    private init()
    {
    }
    
    // Functions for accessing the map below
    func getLocationInfo(xy:[Int])-> String
    {
        return TheMapArray[xy[0]][xy[1]].rawValue;
    }
    
    func canTraverse(x: Int, y: Int)-> Bool
    {
        return TheMapArray[x][y].rawValue != "Water"
    }
    func monsterHere(xy:[Int])-> Bool{
        return TheMapArray[xy[0]][xy[1]].rawValue == "Hydra" || TheMapArray[xy[0]][xy[1]].rawValue == "Mob" || TheMapArray[xy[0]][xy[1]].rawValue == "Golem"
    }
    func townHere(xy: [Int])-> Bool{
        return TheMapArray[xy[0]][xy[1]].rawValue == "Town"
    }
}
