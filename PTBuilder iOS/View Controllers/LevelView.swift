//
//  LevelView.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/1/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class LevelView: UIView {

	var path: UIBezierPath!
	
	var levelPath: UIBezierPath!
	
	var pokemon: Pokemon? = selectedDetailMember
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		
		self.backgroundColor = UIColor.darkGray
	}
	
	
	
	override func draw(_ rect: CGRect) {
		self.createRectangle()
		
		let rectMultiplier = pokemon?.determineMultipliersForStatRectangles()
		//specify fill color and apply it to the path
		UIColor.orange.setFill()
		path.fill()
		
		//specify a border color
		UIColor.purple.setStroke()
		path.stroke()
		
		self.createLevelInRect(levelMult: rectMultiplier?["hp"] ?? 0.5)
		UIColor.green.setFill()
		levelPath.fill()
		UIColor.blue.setStroke()
		levelPath.stroke()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

	func createRectangle() {
		//initialize path
		path = UIBezierPath()

		// Specify the point that the path should start get drawn.
		path.move(to: CGPoint(x: 0.0, y: 0.0))
		
		// Create a line between the starting point and the bottom-left side of the view.
		path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
		
		// Create the bottom line (bottom-left to bottom-right).
		path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
		
		// Create the vertical line from the bottom-right to the top-right side.
		path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
		
		// Close the path. This will create the last line automatically.
		path.close()
		
	}
	
	func createLevelInRect(levelMult: CGFloat) {
		let multiplier: CGFloat = levelMult
		
		levelPath = UIBezierPath()
		levelPath.move(to: CGPoint(x: 0.0, y: 0.0))
		levelPath.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
		
		// Create the bottom line (bottom-left to bottom-right).
		levelPath.addLine(to: CGPoint(x: self.frame.size.width * multiplier, y: self.frame.size.height))
		
		// Create the vertical line from the bottom-right to the top-right side.
		levelPath.addLine(to: CGPoint(x: self.frame.size.width * multiplier, y: 0.0))
		
		// Close the path. This will create the last line automatically.
		levelPath.close()
		
	}
	
}
