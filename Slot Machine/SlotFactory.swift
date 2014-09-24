//
//  SlotFactory.swift
//  Slot Machine
//
//  Created by Jamie Layne on 9/22/14.
//  Copyright (c) 2014 Jamie Layne. All rights reserved.
//

import Foundation
import UIKit

class SlotFactory {
	
	class func createSlots(#numberOfContainers: CGFloat, numberOfSlots: CGFloat) -> [[Slot]] {
		var slots: [[Slot]] = []
		
		for( var containerNumber:CGFloat = 0; containerNumber < numberOfContainers; containerNumber++) {
			var containerSlots: [Slot] = []
			
			for( var slotNumber:CGFloat = 0; slotNumber < numberOfSlots; slotNumber++ ) {
				
				var slot: Slot = SlotFactory.createSlot(containerSlots)
				containerSlots.append(slot)
			}
			slots.append(containerSlots)
		}
		
		return slots
	}
	
	class func createSlot( currentCards: [Slot] ) -> Slot {
		var currentCardValues: [Int] = []
		
		for card in currentCards {
			currentCardValues.append(card.value)
		}
		
		var randomNumber:Int
		
		do {
			randomNumber = Int( arc4random_uniform( UInt32(12) ) ) + 1
		} while( contains(currentCardValues, randomNumber) )
		
		var slot: Slot = Slot(value: randomNumber)
		return slot
	}
	
	class func checkWinnings(var slots: [[Slot]]) -> Int {
		
		func checkRowWin(var row: [Slot]) -> Int{
			var rowMultiplier = 0
			
			// Sort row
			row.sort() {
				return $0.value < $1.value
			}
			
			var isStraight: Bool = true
			var isFlush: Bool = true
			var isSet: Bool = true
			
			// Check
			
			for var rowIndex = 1; rowIndex < row.count; rowIndex++ {
				
				if !(row[rowIndex].isRed == row[rowIndex-1].isRed)  {
					isFlush = false
				}
				
				if row[rowIndex].value != row[rowIndex-1].value + 1 {
					isStraight = false
				}
				
				if row[rowIndex].value != row[rowIndex-1].value {
					isSet = false
				}
				
 			}
			
			// Score Multipliers
			if( isSet ) {
				println("Row \(row) contains a set")
				rowMultiplier += 1
			}
			if( isFlush ) {
				println("Row \(row) contains a Flush")
				rowMultiplier += 2
			}
			if( isStraight ) {
				println("Row \(row) contains a straight")
				rowMultiplier += 3
			}
			if( isSet && isFlush) {
				println("Row \(row) contains a set flush")
				rowMultiplier += 8
			}
			if( isStraight && isFlush) {
				println("Row \(row) contains a straight flush")
				rowMultiplier += 10
			}
			return rowMultiplier
		}
		
		// Score Multiplier: 0 means no win
		var multipier: Int = 0
		
		var rowSlots: [[Slot]] = [[Slot]](count: slots.count, repeatedValue: [])
		
		// Inverse Slots from Cols to Rows
		for var col = 0; col < slots.count; col++ {
			for var row = 0; row < slots[col].count; row++ {
				rowSlots[row].append( slots[col][row] )
			}
		}
		
		// check each row for winnings - add to score multiplier
		for var row = 0; row < rowSlots.count; row++ {
			multipier += checkRowWin( rowSlots[row] )
		}
		
		return multipier
	}
}