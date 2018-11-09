//
//  SuggestedMonDetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/8/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class SuggestedMonDetailViewController: UIViewController {

	var pokemon: Pokemon?
	
	@IBOutlet weak var monNameLabel: UILabel!
	@IBOutlet weak var monImageView: UIImageView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		ItemDex.initializeItemDex()
		MoveDex.initializeMoveDex()
		refreshUI()
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
		if let suggestedDetailMon = pokemon {
			monNameLabel.text = suggestedDetailMon.species
			monImageView.image = suggestedDetailMon.monSprite
		} else {
			monNameLabel.text = "Error"
			monImageView.image = UIImage(named: "0.png")
		}
	}
		
		
		
	
	
}
