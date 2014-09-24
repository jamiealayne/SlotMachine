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
	
	// Slots 
	var slots: [[Slot]] = []
	var credits: Int = 50
	var winnings: Int = 0
	var currentBet: Int = 0
	
	
	// Top Container Variables
	var titleLable: UILabel!
	
	// Third Container Variables
	var creditsLabel: UILabel!
	var creditsTitleLabel: UILabel!
	
	var betLabel: UILabel!
	var betTitleLabel: UILabel!
	
	var winnerPaidLabel: UILabel!
	var winnerPaidTitleLable: UILabel!
	
	// Fourth Container Variables
	var resetButton: UIButton!
	var bet1Button: UIButton!
	var betMaxButton: UIButton!
	var spinButton: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		setUpContainerViews()
		hardReset()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func resetButtonPressed(button: UIButton) {
		self.hardReset()
	}
	
	func bet1ButtonPressed(button: UIButton) {
		if credits <= 0 {
			showAlert(header: "No More Credits", message: "Reset Game" )
		} else if currentBet < 5 {
			currentBet += 1
			credits -= 1
			updateMainView()
		} else {
			showAlert(message: "You can only bet 5 credits at a time")
		}
	}
	
	func betMaxButtonPressed(button: UIButton) {
		if credits < 5 {
			showAlert(header: "Not enough credits", message: "Bet less")
		} else if currentBet < 5 {
			credits -= (5 - currentBet)
			currentBet = 5
			updateMainView()
		} else {
			showAlert(message: "You can only bet 5 credits at a time")
		}
	}
	
	func spinButtonPressed(button: UIButton) {
		if( currentBet == 0 ) {
			showAlert(message: "You must bet at least 1 credit to play")
			return
		}
		removeSlotImageViews()
		setUpSecondContainer(self.secondContainer)
		var multiplier = SlotFactory.checkWinnings(self.slots)
		var win = self.currentBet * multiplier
		self.credits += win
		self.winnings = win
		self.currentBet = 0
		updateMainView()
		
		if( win > 0 ) {
			//showAlert(header: "Winner!", message: "You've just won \(win) credits")
		}
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
		setUpFourthContainer(self.fourthContainer)
		
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
		self.slots = SlotFactory.createSlots(numberOfContainers: kNumberOfContainers, numberOfSlots: kNumberOfSlots)
		
		for( var containerNum: CGFloat = 0; containerNum < kNumberOfContainers; containerNum++ ) {
			for ( var slotNumber: CGFloat = 0; slotNumber < kNumberOfSlots; slotNumber++ ) {
				var slotImageView = UIImageView()
				
				slotImageView.image = self.slots[Int(containerNum)][Int(slotNumber)].image
				
				slotImageView.backgroundColor = UIColor.yellowColor()
				
				slotImageView.frame = CGRectMake(
						containerView.bounds.origin.x + containerView.bounds.size.width *
							CGFloat(containerNum) / kNumberOfContainers + kMarginForSlot/2,
						containerView.bounds.origin.y + containerView.bounds.size.height *
							CGFloat(slotNumber) / kNumberOfSlots + kMarginForSlot/2,
						containerView.bounds.width / kNumberOfContainers - kMarginForSlot,
						containerView.bounds.height / kNumberOfContainers - kMarginForSlot
					)
				
				containerView.addSubview(slotImageView)
			}
		}
	}
	
	func setUpThirdContainer(containerView: UIView) {
		var numButtons: CGFloat = 3.0
		var numButtonRows: CGFloat = 2.0
		
		func createLabel(text: String, row: CGFloat, col: CGFloat, font: UIFont,
				color: UIColor = UIColor.blackColor(), backgroundColor: UIColor = UIColor.clearColor() ) -> UILabel {
					
			var newLabel = UILabel()
			newLabel.text = text
			newLabel.textColor = color
			newLabel.backgroundColor = backgroundColor
			newLabel.font = font
			newLabel.sizeToFit()
			
			newLabel.center	= CGPointMake(
				(2 * col - 1)/2 * containerView.frame.width / numButtons,
				(2 * row - 1)/2 * containerView.frame.height / numButtonRows
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
	
	func setUpFourthContainer(containerView: UIView)  {
		var numButtons: CGFloat = 4
		
		func createButton(buttonNumber: CGFloat, title: String, color: UIColor, backgroundColor: UIColor, font: UIFont, buttonAction: Selector, forState: UIControlState = UIControlState.Normal) -> UIButton {
			var button = UIButton()
			button.setTitle(title, forState: forState)
			button.setTitleColor(color, forState: forState)
			button.backgroundColor = backgroundColor
			button.titleLabel?.font = font
			button.sizeToFit()
			button.center = CGPointMake( (2 * buttonNumber - 1)/2 *  containerView.frame.width/numButtons, containerView.frame.height / 2)
			button.addTarget(self, action: buttonAction, forControlEvents: UIControlEvents.TouchUpInside)
			return button
		}
		
		
		let buttonFont = UIFont(name: "SuperClarendon-Bold", size: 12)
		
		self.resetButton = createButton(1, "Reset", UIColor.blueColor(), UIColor.lightGrayColor(), buttonFont, "resetButtonPressed:")
		containerView.addSubview(self.resetButton)
		
		self.bet1Button = createButton(2, "Bet 1", UIColor.blueColor(), UIColor.greenColor(), buttonFont, "bet1ButtonPressed:")
		containerView.addSubview(self.bet1Button)
		
		self.betMaxButton = createButton(3, "Bet Max", UIColor.blueColor(), UIColor.redColor(), buttonFont, "betMaxButtonPressed:")
		containerView.addSubview(self.betMaxButton)
		
		self.spinButton = createButton(4, "Spin", UIColor.blueColor(), UIColor.greenColor(), buttonFont, "spinButtonPressed:")
		containerView.addSubview(self.spinButton)
		
	}
	
	// clears all previously added image views from the second container
	func removeSlotImageViews() {
		if let container = self.secondContainer  {
			let subViews: Array = container.subviews
			for view in subViews  {
				view.removeFromSuperview()
			}
		}
	}
	
	func hardReset() {
		self.removeSlotImageViews()
		slots.removeAll(keepCapacity: true)
		self.setUpSecondContainer(self.secondContainer)
		self.credits = 50
		self.winnings = 0
		self.currentBet = 0
		
		updateMainView()
		
	}
	
	func updateMainView() {
		self.creditsLabel.text = "\(credits)"
		self.betLabel.text = "\(currentBet)"
		self.winnerPaidLabel.text = "\(winnings)"
		
	}
	
	func showAlert(header: String = "Warning", message: String ) {
		var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
		
		alert.addAction( UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil ) )
		self.presentViewController(alert, animated: true, completion: nil)
	}
}


