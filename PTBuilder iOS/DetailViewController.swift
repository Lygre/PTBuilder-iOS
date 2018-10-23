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
	@IBOutlet weak var abilityLabel: UILabel!
	@IBOutlet weak var natureLabel: UILabel!
	
	@IBOutlet weak var pokemonPropertyPicker: UIPickerView!
	
	
	
	
	
	var natureList: [String] = [String]()
	var propertyPickerData: [String] = [String]()
	
	var pokemon: Pokemon? {
		didSet {
			refreshUI()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		ItemDex.initializeItemDex()
        // Do any additional setup after loading the view.
//		let initMember = teamMaster.members
//		let baseArray = [Pokemon]()
		self.pokemonPropertyPicker.delegate = self
		self.pokemonPropertyPicker.dataSource = self
		
		
		
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
	
	func refreshUI() {
		loadViewIfNeeded()
		pokemonNameLabel.text = pokemon?.species
		spriteImageView.image = pokemon?.monSprite
		natureLabel.text = pokemon?.nature
		abilityLabel.text = pokemon?.ability
		itemLabel.text = pokemon?.item.name
		
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
