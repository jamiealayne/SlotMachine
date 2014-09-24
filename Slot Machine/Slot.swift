//
//  Slot.swift
//  Slot Machine
//
//  Created by Jamie Layne on 9/22/14.
//  Copyright (c) 2014 Jamie Layne. All rights reserved.
//

import Foundation
import UIKit

struct Slot: Printable {
	
	var value:Int = 1 {
		didSet(newValue) {
			if( newValue <= 0 ) {
				self.value = 1
			} else if( newValue >= 14) {
				self.value = 13
			}
		}
	}
	
	var image: UIImage {
		return UIImage(named: self.getName)
	}
	
	var isRed: Bool {
		var isCardRed = [1: true, 2: true, 3: true, 4: true, 5: false, 6: false, 7: true, 8: false, 9: false, 10: true, 11: false, 12: false, 13: true]
		return isCardRed[ self.value]!
	}
	
	var getName:String {
		var names = [1:"Ace", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine", 10:"Ten", 11:"Jack", 12:"Queen", 13: "King"]
		return names[ self.value ]!
	}
	
	init(value: Int) {
		self.value = value
	}
	
	var description: String {
		var color = "Black"
			if( self.isRed) {
				color = "Red"
			}
		return "\(color) \(self.getName)"
	}

}