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
    

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
//		refreshUI()
	}
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
		let vc = segue.destination as! TeamWeaknessTableViewController
//		vc.activityIndicatorView = UIActivityIndicatorView()
		vc.teamWeaknessTableView = UITableView()
		vc.sectionSelected("Suggested Mons")
    }
	

	func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
		return true
	}
	
	func refreshUI() {
		loadViewIfNeeded()
//		loadView()
		if let suggestedDetailMon = pokemon {
			monNameLabel.text = suggestedDetailMon.species
			monImageView.image = suggestedDetailMon.monSprite
		} else {
			monNameLabel.text = "Error"
			monImageView.image = UIImage(named: "0.png")
		}
	}
		
		
		
	
	
}

extension SuggestedMonDetailViewController: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
}
