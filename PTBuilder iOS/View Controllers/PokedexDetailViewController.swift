//
//  PokedexDetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/2/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class PokedexDetailViewController: UIViewController {
	
	
	

	
	@IBOutlet weak var monImageView: UIImageView!
	@IBOutlet weak var monNameLabel: UILabel!

	@IBOutlet weak var ability1Label: UILabel!
	@IBOutlet weak var ability2Label: UILabel!
	@IBOutlet weak var abilityHiddenLabel: UILabel!
	
	//base stat labels
	@IBOutlet weak var baseHPLabel: UILabel!
	@IBOutlet weak var baseATKLabel: UILabel!
	@IBOutlet weak var baseDEFLabel: UILabel!
	@IBOutlet weak var baseSPALabel: UILabel!
	@IBOutlet weak var baseSPDLabel: UILabel!
	@IBOutlet weak var baseSPELabel: UILabel!
	
	//level 100 stat labels
	@IBOutlet weak var actualHPLabel: UILabel!
	@IBOutlet weak var actualATKLabel: UILabel!
	@IBOutlet weak var actualDEFLabel: UILabel!
	@IBOutlet weak var actualSPALabel: UILabel!
	@IBOutlet weak var actualSPDLabel: UILabel!
	@IBOutlet weak var actualSPELabel: UILabel!
	
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
	
	
	var pokemon: Pokemon? {
		didSet {
			refreshUI()
		}
	}
	
	var team: Team = teamMaster
	
	
	var abilitiesArray: [String] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		MoveDex.initializeMoveDex()
		ItemDex.initializeItemDex()
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let width: CGFloat = 200.0
		let height: CGFloat = 21.0
		
		let hpLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 480.0, width: width, height: height))
		let atkLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 534.0, width: width, height: height))
		let defLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 588.0, width: width, height: height))
		let spaLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 642.0, width: width, height: height))
		let spdLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 696.0, width: width, height: height))
		let speLevelView2 = LevelViewPokedex(frame: CGRect(x: 172.0, y: 750.0, width: width, height: height))
		
		hpLevelView2.accessibilityIdentifier = "hpLevel2"
		atkLevelView2.accessibilityIdentifier = "atkLevel2"
		defLevelView2.accessibilityIdentifier = "defLevel2"
		spaLevelView2.accessibilityIdentifier = "spaLevel2"
		spdLevelView2.accessibilityIdentifier = "spdLevel2"
		speLevelView2.accessibilityIdentifier = "speLevel2"
		
		//		hpLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		//		atkLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		//		defLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		//		spaLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		//		spdLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		//		speLevelView?.pokemonSelected(pokemon ?? Dex.searchDex(searchParam: "bulbasaur")[0])
		
		self.view.addSubview(hpLevelView2)
		self.view.addSubview(atkLevelView2)
		self.view.addSubview(defLevelView2)
		self.view.addSubview(spaLevelView2)
		self.view.addSubview(spdLevelView2)
		self.view.addSubview(speLevelView2)
		// Do any additional setup after loading the view.
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
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
		loadViewIfNeeded()
//		reloadInputViews()
		loadView()
		pokemon?.level = 100
		pokemon?.nature = "hardy"
		pokemon?.calcStatsMutating()
		pokemon?.calcVirtualStatsMutating()
		monImageView.image = UIImage(named: dexNumToSpriteUsingSpecies((pokemon?.species)!) ?? "Bulbasaur")
		monNameLabel.text = pokemon?.species
		print(pokemon?.species)
		switch (pokemon?.abilities.count) {
		case 1:
			ability1Label.text = pokemon?.abilities[0]
			ability2Label.text = "None"
		case 2:
			ability1Label.text = pokemon?.abilities[0]
			ability2Label.text = "None"
			abilityHiddenLabel.text = pokemon?.abilities[1]
		case 3:
			ability1Label.text = pokemon?.abilities[0]
			ability2Label.text = pokemon?.abilities[1]
			abilityHiddenLabel.text = pokemon?.abilities[2]
		default:
			print("something wrong with ability count switch")
		}
		baseHPLabel.text = "\(pokemon!.baseStats["hp"]!)"
		baseATKLabel.text = "\(pokemon!.baseStats["atk"]!)"
		baseDEFLabel.text = "\(pokemon!.baseStats["def"]!)"
		baseSPALabel.text = "\(pokemon!.baseStats["spa"]!)"
		baseSPDLabel.text = "\(pokemon!.baseStats["spd"]!)"
		baseSPELabel.text = "\(pokemon!.baseStats["spe"]!)"
		
		actualHPLabel.text = "\(pokemon!.actualStats["hp"]!)"
		actualATKLabel.text = "\(pokemon!.actualStats["atk"]!)"
		actualDEFLabel.text = "\(pokemon!.actualStats["def"]!)"
		actualSPALabel.text = "\(pokemon!.actualStats["spa"]!)"
		actualSPDLabel.text = "\(pokemon!.actualStats["spd"]!)"
		actualSPELabel.text = "\(pokemon!.actualStats["spe"]!)"
		var weaknessToImageDict: [String: UIImage] = [:]
		if let monWeaknesses = pokemon?.getPokemonWeaknesses(pokemonName: pokemon!) {
			
			
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
		} else {
			print("problem")
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
		
	}
	

	@IBAction func addToTeam(_ sender: Any) {
		team.addMember(pokemon!)
		teamMaster = team
//		let teamView: UISplitViewController = storyboard?.instantiateViewController(withIdentifier: "teamMembersView") as! UISplitViewController
//		self.show(teamView, sender: self)
//		reloadInputViews()
	}
	
	
	
}

extension PokedexDetailViewController: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
}


