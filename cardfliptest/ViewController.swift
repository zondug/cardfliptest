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
	var cardview = UIView()
	
	let transitioningLayer = CALayer()

	let backImage = UIImage(named: "cardback.png")
	let frontImage = UIImage(named: "club_A.png")
	
	let backview: UIImageView = {
		let view = UIImageView(image: #imageLiteral(resourceName: "cardback"))
		return view
	}()
	let frontview: UIImageView = {
		let view = UIImageView(image: #imageLiteral(resourceName: "club_A"))
		return view
	}()
	
	/// **True**: currently back side
	var showingBack = true

	override func viewDidLoad() {
		super.viewDidLoad()

		// put those 2 cards front and back to a same view(myview)
		cardview.frame.origin = CGPoint(x: self.view.center.x - backview.frame.width/2, y: self.view.center.y - backview.frame.height/2)
		cardview.frame.size = backview.bounds.size
		cardview.addSubview(backview)
		
		view.addSubview(cardview)

	}
	
	@IBAction func viewTransitionButton(_ sender: UIButton) {
		// checking current situation of cards
		if (showingBack) {

			UIView.transition(from: backview, to: frontview, duration: 0.3, options: .transitionFlipFromRight, completion: nil)
//			UIView.transition(from: backview, to: frontview, duration: 0.3, options: .transitionCurlUp, completion: nil)

			showingBack = false
		} else {
			
			UIView.transition(from: frontview, to: backview, duration: 0.3, options: .transitionFlipFromRight, completion: nil)
			
			showingBack = true
		}
	}

	@IBAction func layerTransitionButton(_ sender: UIButton) {
				layerTransition()
	}
	
	// studying How to user CATransition
	func layerTransition() {
		
		transitioningLayer.frame = cardview.frame
		transitioningLayer.contentsGravity = kCAGravityResizeAspect

		CATransaction.begin()

		let transition = CATransition()
		
		transition.duration = 0.3
		
		transition.type = "flip"
		transition.subtype = kCATransitionFromRight
		
		cardview.layer.add(transition, forKey: nil)
		transitioningLayer.contents = frontImage
		cardview.layer.addSublayer(transitioningLayer)

		CATransaction.commit()
	}

}

