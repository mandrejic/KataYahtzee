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
        var sum = 0
        for index in 0...4 {
            if (dices[index] == number) {
                sum = sum + number
            }
        }
        return sum
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
        dices.sort {$1 < $0 }
        var number = dices[0]
        for index in 1...4 {
            if (dices[index] == number)
            {
                return number * 2
            }
            number = dices[index]
        }
        return 0
    }
}