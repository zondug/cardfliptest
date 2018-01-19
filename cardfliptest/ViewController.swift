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
	var myview = UIView()
	
	let transitioningLayer = CATextLayer()

	// and front and back of card view
	let a = UIImageView(image: #imageLiteral(resourceName: "cardback")) // is back
	let b = UIImageView(image: #imageLiteral(resourceName: "club_A")) // is front
	
	var showingBack = true // currently back side

	override func viewDidLoad() {
		super.viewDidLoad()

		// put those 2 cards front and back to a view
		myview.frame.origin = CGPoint(x: self.view.center.x - a.frame.width/2, y: self.view.center.y - a.frame.height/2)
		myview.frame.size = a.bounds.size
		myview.addSubview(a)
		
		myview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
		view.addSubview(myview)
		
//		transitioningLayer.frame = myview.frame
//		myview.layer.addSublayer(transitioningLayer)

	}
	
	// if tapped 
	func tap(gesture: UITapGestureRecognizer) {
		
		// checking current situation of cards
		if (showingBack) {
			
			// from back to front
			UIView.transition(from: a, to: b, duration: 0.3, options: .transitionFlipFromRight, completion: nil)
//			UIView.transition(from: a, to: b, duration: 0.3, options: .transitionCurlUp, completion: nil)
//			cardTransition()
			showingBack = false
		} else {
			
			// from front to back
			UIView.transition(from: b, to: a, duration: 0.3, options: .transitionFlipFromRight, completion: nil)
			
//			cardTransition()
			showingBack = true
		}
	}
	
	// How to user CATransition
	func cardTransition() {
		let transition = CATransition()
		transition.duration = 0.7
		
		transition.type = "pageCurl"
		transition.subtype = kCATransitionFromRight
		
		transitioningLayer.add(transition, forKey: "transition")

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

