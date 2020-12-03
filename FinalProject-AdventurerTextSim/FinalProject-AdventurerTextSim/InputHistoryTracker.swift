//
//  InputHistoryTracker.swift
//  FinalProject-AdventurerTextSim
//
//  Created by Student on 12/3/20.
//  Copyright © 2020 Northwest. All rights reserved.
//

import Foundation


class HistoryTracker{
    
    private static var _tracker:HistoryTracker!
    
    static var tracker:HistoryTracker{
        if _tracker==nil {
            _tracker = HistoryTracker()
            
        }
        return _tracker
    }
    
    var counter:Int;
    var array:[[String]];
    
    private init(){
        counter = 0;
        array = [];
    }
    func addHistory(x:Int, y:Int, input: String, output: String){
        array[counter] = [String(x),String(y), input, output];
        counter += 1;
        
    }
    func reset(){
        array = [];
        counter = 0;
    }
    
    
    
    
}
