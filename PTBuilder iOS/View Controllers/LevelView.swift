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
		UIColor.gray.setFill()
		path.fill()
		
		//specify a border color
		UIColor.purple.setStroke()
		path.stroke()
		
		switch (self.accessibilityIdentifier) {
		case "hpLevel":
			let levelMultiplier = rectMultiplier?["hp"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.24 && levelMultiplier < 0.35 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.35 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.24 && levelMultiplier > 0.17 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.13 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "atkLevel":
			let levelMultiplier = rectMultiplier?["atk"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.25 && levelMultiplier < 0.70 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.70 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.25 && levelMultiplier > 0.1 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.1 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "defLevel":
			let levelMultiplier = rectMultiplier?["def"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.32 && levelMultiplier < 0.59 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.59 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.32 && levelMultiplier > 0.19 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.19 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "spaLevel":
			let levelMultiplier = rectMultiplier?["spa"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.38 && levelMultiplier < 0.55 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.55 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.38 && levelMultiplier > 0.21 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.21 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "spdLevel":
			let levelMultiplier = rectMultiplier?["spd"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.32 && levelMultiplier < 0.44 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.44 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.32 && levelMultiplier > 0.20 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.20 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "speLevel":
			let levelMultiplier = rectMultiplier?["spe"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.39 && levelMultiplier < 0.55 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.55 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.39 && levelMultiplier > 0.22 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.22 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
			//--- For other set of LevelViews
		case "hpLevel2":
			let levelMultiplier = rectMultiplier?["hp"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.24 && levelMultiplier < 0.35 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.35 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.24 && levelMultiplier > 0.17 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.13 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "atkLevel2":
			let levelMultiplier = rectMultiplier?["atk"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.25 && levelMultiplier < 0.70 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.70 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.25 && levelMultiplier > 0.1 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.1 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "defLevel2":
			let levelMultiplier = rectMultiplier?["def"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.32 && levelMultiplier < 0.59 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.59 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.32 && levelMultiplier > 0.19 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.19 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "spaLevel2":
			let levelMultiplier = rectMultiplier?["spa"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.38 && levelMultiplier < 0.55 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.55 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.38 && levelMultiplier > 0.21 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.21 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "spdLevel2":
			let levelMultiplier = rectMultiplier?["spd"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.32 && levelMultiplier < 0.44 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.44 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.32 && levelMultiplier > 0.20 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.20 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		case "speLevel2":
			let levelMultiplier = rectMultiplier?["spe"] ?? 0.5
			self.createLevelInRect(levelMult: levelMultiplier)
			if levelMultiplier > 0.39 && levelMultiplier < 0.55 {
				UIColor.yellow.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier >= 0.55 {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.39 && levelMultiplier > 0.22 {
				UIColor.orange.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else if levelMultiplier <= 0.22 {
				UIColor.red.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			} else {
				UIColor.green.setFill()
				levelPath.fill(with: .colorBurn, alpha: 0.9)
			}
		default:
			print("something wrong with draw switch for Levels based on access. identifier")
		}
		
//		self.createLevelInRect(levelMult: rectMultiplier?["hp"] ?? 0.5)
//		UIColor.green.setFill()
//		levelPath.fill()
//		UIColor.blue.setStroke()
//		levelPath.stroke()
		
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

extension LevelView: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
}
