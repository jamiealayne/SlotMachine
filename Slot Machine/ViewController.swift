//
//  ViewController.swift
//  Slot Machine
//
//  Created by Jamie Layne on 9/18/14.
//  Copyright (c) 2014 Jamie Layne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// Container Views
	var firstContainer: UIView!
	var secondContainer: UIView!
	var thirdContainer: UIView!
	var fourthContainer: UIView!
	
	// Constants 
	let kMarginForView: CGFloat = 10.0
	let kMarginForSlot: CGFloat = 2.0
	let kSixth:CGFloat = 1.0/6.0
	let kNumberOfContainers: CGFloat = 3
	let kNumberOfSlots: CGFloat = 3
	
	// Top Container Variables
	var titleLable: UILabel!
	
	// Third Container Variables
	var creditsLabel: UILabel!
	var creditsTitleLabel: UILabel!
	
	var betLabel: UILabel!
	var betTitleLabel: UILabel!
	
	var winnerPaidLabel: UILabel!
	var winnerPaidTitleLable: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		setUpContainerViews()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	func setUpContainerViews() {
		// First Container Config
		self.firstContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y, self.view.bounds.width - (2 * kMarginForView), self.view.bounds.height * kSixth))
		
		self.firstContainer.backgroundColor = UIColor.redColor()
		self.view.addSubview(self.firstContainer)
		setUpFirstContainer(self.firstContainer)
		
		// Second Container Config
		self.secondContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height, self.view.bounds.width - (2 * kMarginForView), self.view.bounds.height * (3 * kSixth) ) )
		
		self.secondContainer.backgroundColor = UIColor.blackColor()
		self.view.addSubview(self.secondContainer)
		setUpSecondContainer(self.secondContainer)
		
		// Third Container Config
		self.thirdContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (2 * kMarginForView), self.view.bounds.height * kSixth ) )
		
		self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
		self.view.addSubview(self.thirdContainer)
		setUpThirdContainer(self.thirdContainer)
		
		// Fourth Container Config
		self.fourthContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width - (2 * kMarginForView), self.view.bounds.height * kSixth ) )
		
		self.fourthContainer.backgroundColor = UIColor.blackColor()
		self.view.addSubview(self.fourthContainer)

		
	}
	
	func setUpFirstContainer(containerView: UIView) {
		self.titleLable = UILabel()
		self.titleLable.text = "Super Slots"
		self.titleLable.textColor = UIColor.yellowColor()
		self.titleLable.font = UIFont(name: "MarkerFelt-wide", size: 40)
		self.titleLable.sizeToFit()
		self.titleLable.center = containerView.center
		containerView.addSubview(self.titleLable)
		
	}
	
	func setUpSecondContainer(containerView: UIView) {
		
		for( var containerNum: CGFloat = 0; containerNum < kNumberOfContainers; containerNum++ ) {
			for ( var slotNumber: CGFloat = 0; slotNumber < kNumberOfSlots; slotNumber++ ) {
				var slotImageView = UIImageView()
				slotImageView.backgroundColor = UIColor.yellowColor()
				
				slotImageView.frame = CGRectMake(
						containerView.bounds.origin.x + containerView.bounds.size.width * CGFloat(containerNum) / kNumberOfContainers,
						containerView.bounds.origin.y + containerView.bounds.size.height * CGFloat(slotNumber) / kNumberOfSlots,
						containerView.bounds.width / kNumberOfContainers - kMarginForSlot,
						containerView.bounds.height / kNumberOfContainers - kMarginForSlot
					)
				
				containerView.addSubview(slotImageView)
			}
		}
	}
	
	func setUpThirdContainer(containerView: UIView) {
		
		func createLabel(text: String, row: CGFloat, col: CGFloat, font: UIFont,
				color: UIColor = UIColor.blackColor(), backgroundColor: UIColor = UIColor.clearColor() ) -> UILabel {
					
			var newLabel = UILabel()
			newLabel.text = text
			newLabel.textColor = color
			newLabel.backgroundColor = backgroundColor
			newLabel.font = UIFont(name: "Manlo-Bold", size: 16)
			newLabel.sizeToFit()
			
			newLabel.center	= CGPointMake(
				(2 * col - 1)/2 * containerView.frame.width / kNumberOfContainers,
				(2 * row - 1)/2 * containerView.frame.height / kNumberOfSlots
			)
			newLabel.textAlignment = NSTextAlignment.Center
			
			return newLabel
		}
		var labelFont = UIFont(name: "Manlo-Bold", size: 16)
		var titleFont = UIFont(name: "AmericanTypewriter", size: 14)
		var labelColor = UIColor.redColor()
		var labelBG = UIColor.darkGrayColor()
		
		self.creditsLabel = createLabel("00000", 1, 1, labelFont, color: labelColor, backgroundColor: labelBG)
		containerView.addSubview(self.creditsLabel)
		
		self.creditsTitleLabel = createLabel("Credits", 2, 1, titleFont )
		containerView.addSubview(self.creditsTitleLabel)

		self.betLabel = createLabel("0000", 1, 2, labelFont, color: labelColor, backgroundColor: labelBG)
		containerView.addSubview(self.betLabel)
		
		self.betTitleLabel = createLabel("Bet", 2, 2, titleFont)
		containerView.addSubview(self.betTitleLabel)
		
		self.winnerPaidLabel = createLabel("00000", 1, 3, labelFont, color: labelColor, backgroundColor: labelBG)
		containerView.addSubview(self.winnerPaidLabel)
		
		self.winnerPaidTitleLable = createLabel("Winner Paid", 2, 3, titleFont)
		containerView.addSubview(self.winnerPaidTitleLable)
		
		
	}
}


