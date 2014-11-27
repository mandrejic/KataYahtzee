//
//  Yahtzee.swift
//  KataYahtzee
//
//  Created by Milos Andrejic on 11/21/14.
//  Copyright (c) 2014 Zuehlke. All rights reserved.
//

import Foundation

class Yahtzee {
    
    func sum(dices: [Int], number: Int) -> Int {
        return dices.filter {$0 == number}.count * number
    }
    
    func ones(dices: [Int]) -> Int {
        return sum(dices, number: 1)
    }
    
    func twos(dices: [Int]) -> Int {
        return sum(dices, number: 2)
    }
    
    func threes(dices: [Int]) -> Int {
        return sum(dices, number: 3)
    }
    
    func fours(dices: [Int]) -> Int {
        return sum(dices, number: 4)
    }
    
    func fives(dices: [Int]) -> Int {
        return sum(dices, number: 5)
    }
    
    func sixes(dices: [Int]) -> Int {
        return sum(dices, number: 6)
    }
    
    func pair(var dices: [Int]) -> Int {
        return nOfAKind(dices, n: 2)
    }
    
    func twoPairs(var dices: [Int]) -> Int {
        
        dices.sort {$1 < $0}
        var sum = 0
        var pairsFound = 0
        
        for var index = 1; index < 5; index++ {
            if(dices[index] == dices[index - 1]){
                sum += 2*dices[index]
                pairsFound++
                index++
                if(pairsFound == 2){
                    return sum
                }
            }
        }
        return 0
    }
    
    func nOfAKind(var dices: [Int], n:Int) -> Int {
        dices.sort{$1 < $0}
        var occurences = [0,0,0,0,0,0]
        for dice in dices{
            if (++occurences[dice-1] == n) {
                return dice * n
            }
            
        }
        return 0
    }
    
    func threeOfAKind(var dices: [Int]) -> Int {
        return nOfAKind(dices, n:3)
    }
    
    func fourOfAKind(var dices: [Int]) -> Int {
        return nOfAKind(dices, n:4)
    }
    
    func smallStraight(var dices: [Int]) -> Int{
        dices.sort{$0 < $1 }
        if(dices == [1,2,3,4,5]){
            return 15
        }
        return 0
    }
    
    func fullHouse(var dices: [Int]) -> Int{
        var triple=threeOfAKind(dices) / 3
        if(triple == 0){
            return 0
        }
        var pair = dices.filter{$0 != triple}
        if(pair.count != 2){
            return 0
        }
        if(pair[0] != pair[1]){
            return 0
        }
        return triple * 3 + pair[0] * 2
    }
}