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
	let VIEW_MARGIN: CGFloat = 10.0
	let SIXTH:CGFloat = 1.0/6.0
	
	
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
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.view.bounds.origin.y, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * SIXTH))
		
		self.firstContainer.backgroundColor = UIColor.redColor()
		self.view.addSubview(self.firstContainer)
		
		// Second Container Config
		self.secondContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.firstContainer.frame.height, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * (3 * SIXTH) ) )
		
		self.secondContainer.backgroundColor = UIColor.blackColor()
		self.view.addSubview(self.secondContainer)
		
		// Third Container Config
		self.thirdContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * SIXTH ) )
		
		self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
		self.view.addSubview(self.thirdContainer)
		
		// Fourth Container Config
		self.fourthContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * SIXTH ) )
		
		self.fourthContainer.backgroundColor = UIColor.blackColor()
		self.view.addSubview(self.fourthContainer)

		
	}
}

