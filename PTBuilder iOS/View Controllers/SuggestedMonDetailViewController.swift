//
//  SuggestedMonDetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/8/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class SuggestedMonDetailViewController: UIViewController {

	var pokemon: Pokemon? {
		didSet {
			refreshUI()
		}
	}
	
	@IBOutlet weak var monNameLabel: UILabel!
	
	override func viewDidLoad() {
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

	
	func refreshUI() {
		if let monName = pokemon?.species {
			monNameLabel.text = monName
		} else { monNameLabel.text = "Error" }
	}
	
}
