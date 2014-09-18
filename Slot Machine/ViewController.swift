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
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	func setUpContainerViews() {
		self.firstContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.view.bounds.origin.y, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * SIXTH))
		
		self.firstContainer.backgroundColor = UIColor.redColor()
		self.view.addSubview(self.firstContainer)
		
		self.secondContainer = UIView(frame:
			CGRectMake(self.view.bounds.origin.x + VIEW_MARGIN, self.firstContainer.frame.height, self.view.bounds.width - (2 * VIEW_MARGIN), self.view.bounds.height * (3 * SIXTH) ) )
		
		self.secondContainer.backgroundColor = UIColor.redColor()
		self.view.addSubview(self.secondContainer)
	}
}

