//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

class BetterViewController: UIViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}

var mod: Float = 157.0
var ok = mod.remainder(dividingBy: Float(exactly: 4)!)

func roundToMultipleFour(value: Float) -> Float {
	var fractionNum = value / 4.0
	let roundedNum = floorf(fractionNum)
	return roundedNum * 4.0

}
roundToMultipleFour(value: mod)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = BetterViewController()
