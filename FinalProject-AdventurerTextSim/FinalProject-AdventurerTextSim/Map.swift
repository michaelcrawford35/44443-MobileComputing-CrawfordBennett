//
//  Map.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 11/16/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation

struct Map{
    private static var _globalMap:Map!
    
    static var globalMap:Map{
        if _globalMap==nil {
            _globalMap = Map();
            
        }
        return _globalMap
    }
    
    private var TheMapArray:[[String]];
    
    private init(){
        
        
    }
    
    
}
