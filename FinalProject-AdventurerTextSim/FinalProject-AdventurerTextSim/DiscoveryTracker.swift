//
//  DiscoveryTracker.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 12/4/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation


class DiscoveryTracker{
    
    
    private static var _dtracker:DiscoveryTracker!
    
    static var dtracker:DiscoveryTracker{
        if _dtracker==nil {
            _dtracker = DiscoveryTracker()
            _dtracker.addDiscovery(x: 12, y: 12, name: "Town")
        }
        return _dtracker
    }
    
    var counter:Int
    var array:[[String]]
    
    private init(){
        counter = 0
        array = []
    }
    func addDiscovery(x:Int, y:Int, name: String){
        var isNotIn = true
        for i in array{
            if(x == Int(i[0]) ?? 0){
                if(y == Int(i[1]) ?? 0){
                    isNotIn = false
                }
            }
        }
        
        if(isNotIn){
            array.insert([String(x),String(y), name], at: counter)
            counter += 1
        }
    }
    func reset(){
        array = []
        counter = 0
    }
   
}
