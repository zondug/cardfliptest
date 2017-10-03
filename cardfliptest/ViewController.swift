//
//  ViewController.swift
//  cardfliptest
//
//  Created by Zondug Kim on 2017. 8. 15..
//  Copyright © 2017년 Zondug Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var myview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
	
	let a = UIImageView(image: #imageLiteral(resourceName: "cardback"))
	let b = UIImageView(image: #imageLiteral(resourceName: "club_A"))
	
	var showingBack = true

	override func viewDidLoad() {
		super.viewDidLoad()

		
		a.frame = myview.bounds
		b.frame = myview.bounds
		
		myview.addSubview(a)
		
		myview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
		view.addSubview(myview)

	}
	
	func tap(gesture: UITapGestureRecognizer) {
		if (showingBack) {
			
			UIView.transition(from: a, to: b, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
			showingBack = false
		} else {
			UIView.transition(from: b, to: a, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
			showingBack = true
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

