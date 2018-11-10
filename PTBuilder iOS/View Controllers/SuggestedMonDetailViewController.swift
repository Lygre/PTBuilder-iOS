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
	
	@IBOutlet weak var bugWeaknessImage: UIImageView!
	@IBOutlet weak var darkWeaknessImage: UIImageView!
	@IBOutlet weak var dragonWeaknessImage: UIImageView!
	@IBOutlet weak var electricWeaknessImage: UIImageView!
	@IBOutlet weak var fairyWeaknessImage: UIImageView!
	@IBOutlet weak var fightingWeaknessImage: UIImageView!
	@IBOutlet weak var fireWeaknessImage: UIImageView!
	@IBOutlet weak var flyingWeaknessImage: UIImageView!
	@IBOutlet weak var ghostWeaknessImage: UIImageView!
	@IBOutlet weak var grassWeaknessImage: UIImageView!
	@IBOutlet weak var groundWeaknessImage: UIImageView!
	@IBOutlet weak var iceWeaknessImage: UIImageView!
	@IBOutlet weak var normalWeaknessImage: UIImageView!
	@IBOutlet weak var poisonWeaknessImage: UIImageView!
	@IBOutlet weak var psychicWeaknessImage: UIImageView!
	@IBOutlet weak var rockWeaknessImage: UIImageView!
	@IBOutlet weak var steelWeaknessImage: UIImageView!
	@IBOutlet weak var waterWeaknessImage: UIImageView!
	
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
			monImageView.image = UIImage(named: dexNumToSpriteUsingSpecies(suggestedDetailMon.species)!)
			var weaknessToImageDict: [String: UIImage] = [:]
			let monWeaknesses = suggestedDetailMon.getPokemonWeaknesses(pokemonName: suggestedDetailMon)
				
				
			for (type, vector) in monWeaknesses {
				switch vector {
				case 0:
					weaknessToImageDict[type] = UIImage(named: "immune.png")
				case 1:
					weaknessToImageDict[type] = UIImage(named: "neutral.png")
				case 2:
					weaknessToImageDict[type] = UIImage(named: "weak2.png")
				case 4:
					weaknessToImageDict[type] = UIImage(named: "weak4.png")
				case -2:
					weaknessToImageDict[type] = UIImage(named: "resist2.png")
				case -4:
					weaknessToImageDict[type] = UIImage(named: "resist4.png")
				default:
					weaknessToImageDict[type] = UIImage(named: "0.png")
					print("Problem with vector to image switch")
				}
				
			}
			
			bugWeaknessImage.image = weaknessToImageDict["Bug"]
			darkWeaknessImage.image = weaknessToImageDict["Dark"]
			dragonWeaknessImage.image = weaknessToImageDict["Dragon"]
			electricWeaknessImage.image = weaknessToImageDict["Electric"]
			fairyWeaknessImage.image = weaknessToImageDict["Fairy"]
			fightingWeaknessImage.image = weaknessToImageDict["Fighting"]
			fireWeaknessImage.image = weaknessToImageDict["Fire"]
			flyingWeaknessImage.image = weaknessToImageDict["Flying"]
			ghostWeaknessImage.image = weaknessToImageDict["Ghost"]
			grassWeaknessImage.image = weaknessToImageDict["Grass"]
			groundWeaknessImage.image = weaknessToImageDict["Ground"]
			iceWeaknessImage.image = weaknessToImageDict["Ice"]
			normalWeaknessImage.image = weaknessToImageDict["Normal"]
			poisonWeaknessImage.image = weaknessToImageDict["Poison"]
			psychicWeaknessImage.image = weaknessToImageDict["Psychic"]
			rockWeaknessImage.image = weaknessToImageDict["Rock"]
			steelWeaknessImage.image = weaknessToImageDict["Steel"]
			waterWeaknessImage.image = weaknessToImageDict["Water"]
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
