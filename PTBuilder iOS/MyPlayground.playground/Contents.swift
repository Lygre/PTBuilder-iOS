//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport



class LevelView: UIView {
	
	var path: UIBezierPath!
	var path2: UIBezierPath!
	var levelPath: UIBezierPath!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		
		self.backgroundColor = UIColor.darkGray
	}
	
	override func draw(_ rect: CGRect) {
		self.createRectangle()
		let levelMultiplier: CGFloat = 0.79
		let blendMode = CGBlendMode.exclusion
		//specify fill color and apply it to the path
		UIColor.purple.setFill()
		path.fill()
		
		//specify a border color
		UIColor.purple.setStroke()
		path.stroke()
		
		self.createLevelInRect(levelMult: levelMultiplier)
		if levelMultiplier > 0.5 {
			UIColor.green.setFill()
			levelPath.fill(with: blendMode, alpha: 0.9)
		} else if levelMultiplier < 0.25 {
			UIColor.purple.setFill()
			path.fill()
			UIColor.red.setFill()
			levelPath.fill(with: blendMode, alpha: 0.9)
		} else if levelMultiplier < 0.5 {
			UIColor.orange.setFill()
			levelPath.fill(with: blendMode, alpha: 0.9)
		}  else {
			UIColor.green.setFill()
			levelPath.fill(with: blendMode, alpha: 0.9)
		}
//		UIColor.green.setFill()
//		levelPath.fill(with: blendMode, alpha: 0.9)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	
	func createRectangle() {
		//initialize path
		path = UIBezierPath()
		
		// Specify the point that the path should start get drawn.
		path.move(to: CGPoint(x: 0.0, y: 0.0))
		
		// Create a line between the starting point and the bottom-left side of the view.
		path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
		
		// Create the bottom line (bottom-left to bottom-right).
		path.addLine(to: CGPoint(x: self.frame.size.width * 0.3, y: self.frame.size.height))
		
		// Create the vertical line from the bottom-right to the top-right side.
		path.addLine(to: CGPoint(x: self.frame.size.width * 0.5, y: 0.0))
		
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

class BetterViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		view.backgroundColor = UIColor.white
		let width: CGFloat = 200.0
		let height: CGFloat = 21.0
		
		let hpLevelView = LevelView(frame: CGRect(x: 20.0, y: 20.0, width: width, height: height))
		let atkLevelView = LevelView(frame: CGRect(x: 20.0, y: 50.0, width: width, height: height))
		let defLevelView = LevelView(frame: CGRect(x: 20.0, y: 80.0, width: width, height: height))
		let spaLevelView = LevelView(frame: CGRect(x: 20.0, y: 110.0, width: width, height: height))
		let spdLevelView = LevelView(frame: CGRect(x: 20.0, y: 140.0, width: width, height: height))
		let speLevelView = LevelView(frame: CGRect(x: 20.0, y: 170.0, width: width, height: height))
		
		hpLevelView.accessibilityIdentifier = "hpLevel"
		atkLevelView.accessibilityIdentifier = "atkLevel"
		defLevelView.accessibilityIdentifier = "defLevel"
		spaLevelView.accessibilityIdentifier = "spaLevel"
		spdLevelView.accessibilityIdentifier = "spdLevel"
		speLevelView.accessibilityIdentifier = "speLevel"
		
		self.view.addSubview(hpLevelView)
		self.view.addSubview(atkLevelView)
		self.view.addSubview(defLevelView)
		self.view.addSubview(spaLevelView)
		self.view.addSubview(spdLevelView)
		self.view.addSubview(speLevelView)
	}
	
	
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = BetterViewController()
