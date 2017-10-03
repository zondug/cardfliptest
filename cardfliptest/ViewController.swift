//
//  ViewController.swift
//  cardfliptest
//
//  Created by Zondug Kim on 2017. 8. 15..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// make a view
	var myview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
	
	// and front and back of card view
	let a = UIImageView(image: #imageLiteral(resourceName: "cardback")) // is back
	let b = UIImageView(image: #imageLiteral(resourceName: "club_A")) // is front
	
	var showingBack = true // currently back side

	override func viewDidLoad() {
		super.viewDidLoad()

		// put those 2 cards front and back to a view
		a.frame = myview.bounds
		b.frame = myview.bounds
		myview.addSubview(a)
		
		myview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
		view.addSubview(myview)

	}
	
	// if tapped 
	func tap(gesture: UITapGestureRecognizer) {
		
		// checking current situation of cards
		if (showingBack) {
			
			// from back to front
			UIView.transition(from: a, to: b, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
			showingBack = false
		} else {
			
			// from front to back
			UIView.transition(from: b, to: a, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
			showingBack = true
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

