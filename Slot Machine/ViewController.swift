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
}

