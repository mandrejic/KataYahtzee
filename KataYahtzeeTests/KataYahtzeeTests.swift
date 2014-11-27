//
//  KataYahtzeeTests.swift
//  KataYahtzeeTests
//
//  Created by Milos Andrejic on 11/21/14.
//  Copyright (c) 2014 Zuehlke. All rights reserved.
//

import UIKit
import XCTest

class KataYahtzeeTests: XCTestCase {
    
    //    func testExample() {
    //        // This is an example of a functional test case.
    //        XCTAssert(true, "Pass")
    //    }
    //
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measureBlock() {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
    var kata: Yahtzee!
    
    override func setUp() {
        super.setUp()
        kata = Yahtzee()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHarness() {
        XCTAssertNotNil(kata, "Error")
    }
    
    func testNoOnesReturnsZero() {
        XCTAssertEqual(0, kata.ones([2,3,4,5,5]), "Expected result to be zero, but wasn't")
    }
    
    func testOnes() {
        var inputs = [[1,2,3,4,5], [1,1,2,3,4], [1,2,1,1,3], [1,2,1,1,1], [1,1,1,1,1]]
        var expected = [1,2,3,4,5]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.ones(inputs[index]))
        }
    }
    
    func testNoTwosReturnsZero() {
        XCTAssertEqual(0, kata.twos([1,3,4,5,1]), "Expected result to be zero, but wasn't")
    }
    
    func testTwos() {
        var inputs = [[1,2,3,4,5], [1,2,2,3,4], [2,2,1,2,3], [2,2,2,2,1], [2,2,2,2,2]]
        var expected = [2,4,6,8,10]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.twos(inputs[index]))
        }
    }
    
    func testNoThreesReturnsZero() {
        XCTAssertEqual(0, kata.threes([1,2,4,5,1]), "Expected result to be zero, but wasn't")
    }
    
    func testThrees() {
        var inputs = [[1,2,3,4,5], [1,3,2,3,4], [1,2,3,3,3], [3,3,1,3,3], [3,3,3,3,3]]
        var expected = [3,6,9,12,15]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.threes(inputs[index]))
        }
    }
    
    func testNoFoursReturnsZero() {
        XCTAssertEqual(0, kata.fours([1,3,2,5,1]), "Expected result to be zero, but wasn't")
    }
    
    func testFours() {
        var inputs = [[1,2,3,4,5], [1,4,2,3,4], [4,4,4,1,3], [4,2,4,4,4], [4,4,4,4,4]]
        var expected = [4,8,12,16,20]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.fours(inputs[index]))
        }
    }
    
    func testNoFivesReturnsZero() {
        XCTAssertEqual(0, kata.fives([1,3,4,2,1]), "Expected result to be zero, but wasn't")
    }
    
    func testFives() {
        var inputs = [[1,2,3,4,5], [5,1,5,3,4], [5,2,5,1,5], [5,5,5,1,5], [5,5,5,5,5]]
        var expected = [5,10,15,20,25]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.fives(inputs[index]))
        }
    }
    
    func testNoSixesReturnsZero() {
        XCTAssertEqual(0, kata.sixes([1,3,4,5,1]), "Expected result to be zero, but wasn't")
    }
    
    func testSixes() {
        var inputs = [[1,2,3,4,6], [6,6,2,3,4], [6,2,6,6,3], [6,6,6,6,1], [6,6,6,6,6]]
        var expected = [6,12,18,24,30]
        for index in 0...4 {
            XCTAssertEqual(expected[index], kata.sixes(inputs[index]))
        }
    }
    
    func testNoPairReturnsZero() {
        XCTAssertEqual(0, kata.pair([1,2,3,4,5]))
    }
    
    func testPair() {
        XCTAssertEqual(6, kata.pair([1,2,3,4,3]))
    }
    
    func testHigherPair() {
        XCTAssertEqual(6, kata.pair([1,2,3,1,3]))
    }
    
    func testNoTwoPairsReturnsZero() {
        XCTAssertEqual(0, kata.twoPairs([1,2,3,4,5]))
    }
    
    func testTwoPairs(){
        XCTAssertEqual(6, kata.twoPairs([1,1,2,2,3]))
    }
    
    func testTwoPairsInFourOfAKind(){
        XCTAssertEqual(4, kata.twoPairs([1,1,1,1,3]))
    }
    
    func testNoThreeOfAKind(){
        XCTAssertEqual(0,kata.threeOfAKind([1,2,3,2,4]))
    }
    
    func testThreeOfAKind(){
        XCTAssertEqual(6,kata.threeOfAKind([1,2,2,2,4]))
    }
    
    func testNoFourOfAKind() {
        XCTAssertEqual(0,kata.fourOfAKind([1,2,2,2,4]))
    }
    
    func testFourOfAKind() {
        XCTAssertEqual(8,kata.fourOfAKind([1,2,2,2,2]))
    }
    
    func testSmallStraight(){
        XCTAssertEqual(15, kata.smallStraight([1,2,3,4,5]))
    }
    
    func testNoSmallStraight(){
        XCTAssertEqual(0, kata.smallStraight([1,2,3,4,2]))
    }
    
    func testFullHouse(){
        XCTAssertEqual(15, kata.fullHouse([1,6,1,1,6]))
    }
    
    func testNoFullHouse(){
        XCTAssertEqual(0, kata.fullHouse([1,6,3,1,6]))
    }
    
    func testNoFullHouseFiveOfAKind(){
        XCTAssertEqual(0, kata.fullHouse([6,6,6,6,6]))
    }
    
}
