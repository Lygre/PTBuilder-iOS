//
//  CalculatorViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/16/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

public class CalculatorViewController: UIViewController {

	//--Swift vars and constants
	
	
	//objc vars
	
	
	//----IBOutlets
	@IBOutlet weak var terrainControl: UISegmentedControl!
	@IBOutlet weak var weatherControl: UISegmentedControl!
	@IBOutlet weak var screensControlSide1: UISegmentedControl!
	@IBOutlet weak var screensControlSide2: UISegmentedControl!
	
	@IBOutlet weak var monImageSide1: UIImageView!
	@IBOutlet weak var monImageSide2: UIImageView!
	
	
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
