//
//  DetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/22/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	
	@IBOutlet weak var pokemonPropertySegmentedSelector: UISegmentedControl!
	
	@IBOutlet weak var pokemonNameLabel: UILabel!
	@IBOutlet weak var spriteImageView: UIImageView!
	@IBOutlet weak var itemLabel: UILabel!
	@IBOutlet weak var itemImage: UIImageView!
	@IBOutlet weak var abilityLabel: UILabel!
	@IBOutlet weak var natureLabel: UILabel!
	@IBOutlet weak var levelLabel: UILabel!
	//move labels
	@IBOutlet weak var move1Label: UILabel!
	@IBOutlet weak var move2Label: UILabel!
	@IBOutlet weak var move3Label: UILabel!
	@IBOutlet weak var move4Label: UILabel!
	//base stat labels
	@IBOutlet weak var baseHPLabel: UILabel!
	@IBOutlet weak var baseATKLabel: UILabel!
	@IBOutlet weak var baseDEFLabel: UILabel!
	@IBOutlet weak var baseSPALabel: UILabel!
	@IBOutlet weak var baseSPDLabel: UILabel!
	@IBOutlet weak var baseSPELabel: UILabel!
	//EV sliders
	@IBOutlet weak var hpEVSlider: UISlider!
	@IBOutlet weak var atkEVSlider: UISlider!
	@IBOutlet weak var defEVSlider: UISlider!
	@IBOutlet weak var spaEVSlider: UISlider!
	@IBOutlet weak var spdEVSlider: UISlider!
	@IBOutlet weak var speEVSlider: UISlider!
	//EV value labels
	@IBOutlet weak var hpEVLabel: UILabel!
	@IBOutlet weak var atkEVLabel: UILabel!
	@IBOutlet weak var defEVLabel: UILabel!
	@IBOutlet weak var spaEVLabel: UILabel!
	@IBOutlet weak var spdEVLabel: UILabel!
	@IBOutlet weak var speEVLabel: UILabel!
	
	//iv text fields
	@IBOutlet weak var hpIVTextField: UITextField!
	@IBOutlet weak var atkIVTextField: UITextField!
	@IBOutlet weak var defIVTextField: UITextField!
	@IBOutlet weak var spaIVTextField: UITextField!
	@IBOutlet weak var spdIVTextField: UITextField!
	@IBOutlet weak var speIVTextField: UITextField!
	
	
	//actual stats labels
	@IBOutlet weak var actualHPLabel: UILabel!
	@IBOutlet weak var actualATKLabel: UILabel!
	@IBOutlet weak var actualDEFLabel: UILabel!
	@IBOutlet weak var actualSPALabel: UILabel!
	@IBOutlet weak var actualSPDLabel: UILabel!
	@IBOutlet weak var actualSPELabel: UILabel!
	
	@IBOutlet weak var hpVirtualLabel: UILabel!
	@IBOutlet weak var atkVirtualLabel: UILabel!
	@IBOutlet weak var defVirtualLabel: UILabel!
	@IBOutlet weak var spaVirtualLabel: UILabel!
	@IBOutlet weak var spdVirtualLabel: UILabel!
	@IBOutlet weak var speVirtualLabel: UILabel!
	//progress levels for stats
	@IBOutlet weak var hpProgressBar: UIProgressView!
	@IBOutlet weak var atkProgressBar: UIProgressView!
	@IBOutlet weak var defProgressBar: UIProgressView!
	@IBOutlet weak var spaProgressBar: UIProgressView!
	@IBOutlet weak var spdProgressBar: UIProgressView!
	@IBOutlet weak var speProgressBar: UIProgressView!
	
	
	@IBOutlet weak var pokemonPropertyPicker: UIPickerView!

	
	var learnsetMoves = [Move]()
	
	var natureList: [String] = [String]()
	var propertyPickerData: [String] = [String]()
	
	var pokemon: Pokemon? {
		didSet {
			refreshUI()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		MoveDex.initializeMoveDex()
		ItemDex.initializeItemDex()
        // Do any additional setup after loading the view.
//		let initMember = teamMaster.members
//		let baseArray = [Pokemon]()
		self.pokemonPropertyPicker.delegate = self
		self.pokemonPropertyPicker.dataSource = self
		
		
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let width: CGFloat = 200.0
		let height: CGFloat = 21.0
		
		let hpLevelView = LevelView(frame: CGRect(x: 760.0, y: 480.0, width: width, height: height))
		let atkLevelView = LevelView(frame: CGRect(x: 760.0, y: 534.0, width: width, height: height))
		let defLevelView = LevelView(frame: CGRect(x: 760.0, y: 588.0, width: width, height: height))
		let spaLevelView = LevelView(frame: CGRect(x: 760.0, y: 642.0, width: width, height: height))
		let spdLevelView = LevelView(frame: CGRect(x: 760.0, y: 696.0, width: width, height: height))
		let speLevelView = LevelView(frame: CGRect(x: 760.0, y: 750.0, width: width, height: height))
		
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
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return propertyPickerData.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return propertyPickerData[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let propertySelectorIndex = pokemonPropertySegmentedSelector.selectedSegmentIndex
		switch propertySelectorIndex {
		case 0:
			pokemon?.item = ItemDex.searchItemDex(searchParam: propertyPickerData[row])
		case 1:
			pokemon?.ability = propertyPickerData[row]
		case 2:
			var sortedNatureList: [String] = [String]()
			for (nature, _) in Dex.natureList {
				sortedNatureList.append(nature.capitalized)
			}
			sortedNatureList.sort()
			pokemon?.nature = sortedNatureList[row]
		case 3:
			pokemon?.level = Int(propertyPickerData[row]) ?? 100
		case 4:
			pokemon?.move1 = MoveDex.searchMovedex(searchParam: propertyPickerData[row])
		case 5:
			pokemon?.move2 = MoveDex.searchMovedex(searchParam: propertyPickerData[row])
		case 6:
			pokemon?.move3 = MoveDex.searchMovedex(searchParam: propertyPickerData[row])
		case 7:
			pokemon?.move4 = MoveDex.searchMovedex(searchParam: propertyPickerData[row])
		default:
			print("Something went wrong with picker selection switch")
		}
		refreshUI()
		
//		pickerView.isHidden = true
		return
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBAction func pokemonPropertySegmentedSelectorAction(_ sender: Any) {
		print(pokemonPropertySegmentedSelector.selectedSegmentIndex)
		pokemonPropertyPicker.isHidden = false
		refreshUI()
	}
	
	
	@IBAction func sliderChanged(_ sender: Any) {
		//set current pokemon's EVs based on updated slider values
		pokemon?.eVs["hp"] = Int.init(hpEVSlider.value)
		pokemon?.eVs["atk"] = Int.init(atkEVSlider.value)
		pokemon?.eVs["def"] = Int.init(defEVSlider.value)
		pokemon?.eVs["spa"] = Int.init(spaEVSlider.value)
		pokemon?.eVs["spd"] = Int.init(spdEVSlider.value)
		pokemon?.eVs["spe"] = Int.init(speEVSlider.value)
		pokemon?.calcStatsMutating()
		pokemon?.calcVirtualStatsMutating()
		refreshUI()
		
		print(pokemon?.eVs["hp"], pokemon?.eVs["atk"])
		print(pokemon?.virtualStats)
	}
	
	@IBAction func ivValueChanged(_ sender: Any) {
		pokemon?.iVs["hp"] = Int.init(hpIVTextField.text ?? "0")
		pokemon?.iVs["atk"] = Int.init(atkIVTextField.text ?? "0")
		pokemon?.iVs["def"] = Int.init(defIVTextField.text ?? "0")
		pokemon?.iVs["spa"] = Int.init(spaIVTextField.text ?? "0")
		pokemon?.iVs["spd"] = Int.init(spdIVTextField.text ?? "0")
		pokemon?.iVs["spe"] = Int.init(speIVTextField.text ?? "0")
		pokemon?.calcStatsMutating()
		pokemon?.calcVirtualStatsMutating()
		refreshUI()
	}
	
	
	
	func refreshUI() {
		
		loadViewIfNeeded()

		
		pokemonNameLabel.text = pokemon?.species
		spriteImageView.image = pokemon?.monSprite
		natureLabel.text = pokemon?.nature
		abilityLabel.text = pokemon?.ability
		itemLabel.text = pokemon?.item.name
		itemImage.image = itemToIcon((pokemon?.item)!)
		levelLabel.text = pokemon?.level.description
		move1Label.text = pokemon?.move1.name
		move2Label.text = pokemon?.move2.name
		move3Label.text = pokemon?.move3.name
		move4Label.text = pokemon?.move4.name
		baseHPLabel.text = "\(pokemon!.baseStats["hp"]!)"
		baseATKLabel.text = "\(pokemon!.baseStats["atk"]!)"
		baseDEFLabel.text = "\(pokemon!.baseStats["def"]!)"
		baseSPALabel.text = "\(pokemon!.baseStats["spa"]!)"
		baseSPDLabel.text = "\(pokemon!.baseStats["spd"]!)"
		baseSPELabel.text = "\(pokemon!.baseStats["spe"]!)"
		
		hpEVSlider.value = Float(pokemon!.eVs["hp"]!)
		atkEVSlider.value = Float(pokemon!.eVs["atk"]!)
		defEVSlider.value = Float(pokemon!.eVs["def"]!)
		spaEVSlider.value = Float(pokemon!.eVs["spa"]!)
		spdEVSlider.value = Float(pokemon!.eVs["spd"]!)
		speEVSlider.value = Float(pokemon!.eVs["spe"]!)
		
		hpEVLabel.text = "\(pokemon!.eVs["hp"]!)"
		atkEVLabel.text = "\(pokemon!.eVs["atk"]!)"
		defEVLabel.text = "\(pokemon!.eVs["def"]!)"
		spaEVLabel.text = "\(pokemon!.eVs["spa"]!)"
		spdEVLabel.text = "\(pokemon!.eVs["spd"]!)"
		speEVLabel.text = "\(pokemon!.eVs["spe"]!)"
		
		hpIVTextField.text = "\(pokemon!.iVs["hp"]!)"
		atkIVTextField.text = "\(pokemon!.iVs["atk"]!)"
		defIVTextField.text = "\(pokemon!.iVs["def"]!)"
		spaIVTextField.text = "\(pokemon!.iVs["spa"]!)"
		spdIVTextField.text = "\(pokemon!.iVs["spd"]!)"
		speIVTextField.text = "\(pokemon!.iVs["spe"]!)"
		
		actualHPLabel.text = "\(pokemon!.actualStats["hp"]!)"
		actualATKLabel.text = "\(pokemon!.actualStats["atk"]!)"
		actualDEFLabel.text = "\(pokemon!.actualStats["def"]!)"
		actualSPALabel.text = "\(pokemon!.actualStats["spa"]!)"
		actualSPDLabel.text = "\(pokemon!.actualStats["spd"]!)"
		actualSPELabel.text = "\(pokemon!.actualStats["spe"]!)"
		
		hpVirtualLabel.text = "\(pokemon!.virtualStats["hp"]!)"
		atkVirtualLabel.text = "\(pokemon!.virtualStats["atk"]!)"
		defVirtualLabel.text = "\(pokemon!.virtualStats["def"]!)"
		spaVirtualLabel.text = "\(pokemon!.virtualStats["spa"]!)"
		spdVirtualLabel.text = "\(pokemon!.virtualStats["spd"]!)"
		speVirtualLabel.text = "\(pokemon!.virtualStats["spe"]!)"
		
		//don't know how I would configure this yet
		//hpProgressBar.setProgress(<#T##progress: Float##Float#>, animated: <#T##Bool#>)
	
		
		
		let propertySelectorIndex = pokemonPropertySegmentedSelector.selectedSegmentIndex
		print(propertySelectorIndex)
		switch propertySelectorIndex {
		case 0:
			let itemList = ItemDex.itemDexArray
			propertyPickerData = [String]()
			for item in itemList {
				propertyPickerData.append(item.name)
			}
			self.pokemonPropertyPicker.reloadAllComponents()
		case 1:
			let abilityList = pokemon?.abilities
			propertyPickerData = abilityList ?? ["None"]
			self.pokemonPropertyPicker.reloadAllComponents()
		case 2:
			natureList = [String]()
			var modString: String = String()
			for (nature, modDict) in Dex.natureList {
				modString = ""
				modString = "\(nature.capitalized) ("
				for (stat, mod) in modDict {
					var modSign: String
					if mod > 1 {
						modSign = "+"
					} else if mod < 1 {
						modSign = "-"
					} else {
						modSign = " "
					}
					modString.append("\(stat)\(modSign) ")
					
					
				}
				modString.append(")")
				natureList.append(modString)
			}
			natureList.sort()
			propertyPickerData = natureList
			self.pokemonPropertyPicker.reloadAllComponents()
		case 3:
			var levelArray: [String] = [String]()
			var levelToAdd = 1
			repeat {
				levelArray.append("\(levelToAdd)")
				levelToAdd += 1
			} while levelToAdd < 101
			propertyPickerData = levelArray
			self.pokemonPropertyPicker.reloadAllComponents()
		case 4:
			let learnset = pokemon?.getPokemonLearnset(pokemon: pokemon!).sorted()
			propertyPickerData = learnset!
			self.pokemonPropertyPicker.reloadAllComponents()
		case 5:
			let learnset = pokemon?.getPokemonLearnset(pokemon: pokemon!).sorted()
			propertyPickerData = learnset!
			self.pokemonPropertyPicker.reloadAllComponents()
		case 6:
			let learnset = pokemon?.getPokemonLearnset(pokemon: pokemon!).sorted()
			propertyPickerData = learnset!
			self.pokemonPropertyPicker.reloadAllComponents()
		case 7:
			let learnset = pokemon?.getPokemonLearnset(pokemon: pokemon!).sorted()
			propertyPickerData = learnset!
			self.pokemonPropertyPicker.reloadAllComponents()
		default:
			print("oops. Something went wrong in the switch")
		}
//		propertyPickerData = pokemon?.abilities ?? ["None"]
	}
	
	
	
	
}

extension DetailViewController: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
}
