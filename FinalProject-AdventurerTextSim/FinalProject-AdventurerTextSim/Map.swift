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
    
    static var globalMap:Map{
        if _globalMap==nil {
            _globalMap = Map()
            
        }
        return _globalMap
    }
    
    private var TheMapArray:[[MapTile]] =
        [
        /*0*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*1*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty],
        /*2*/[MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*3*/[MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*4*/[MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty],
        /*5*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*6*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*7*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*8*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*9*/[MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*10*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*11*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*12*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.town, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty],
        /*13*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*14*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*15*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty],
        /*16*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty],
        /*17*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty, MapTile.empty],
        /*18*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.empty],
        /*19*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*20*/[MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*21*/[MapTile.water, MapTile.empty, MapTile.empty, MapTile.mob, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*22*/[MapTile.water, MapTile.water, MapTile.empty, MapTile.empty, MapTile.empty, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*23*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water],
        /*24*/[MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water, MapTile.water]
        ]
    
    private init(){
        
        
    }
    
    
}
