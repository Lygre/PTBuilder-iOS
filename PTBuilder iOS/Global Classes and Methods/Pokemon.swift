//
//  Pokemon.swift
//  Pokemon Team Builder
//
//  Created by Hugh Broome on 9/11/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//
import UIKit
import Foundation

class Pokemon: NSObject {
	@objc dynamic var num: Int
	@objc dynamic var species: String
	@objc dynamic var types: [String]
	@objc dynamic var baseStats: [String: Int]
	@objc dynamic var abilities: [String]
	
	@objc dynamic var level: Int
	@objc dynamic var nature: String
	@objc dynamic var ability: String
	@objc dynamic var iVs: [String: Int]
	@objc dynamic var eVs: [String: Int]
	@objc dynamic var actualStats: [String: Int]
	@objc dynamic var virtualStats: [String: Int]
	@objc dynamic var move1: Move
	@objc dynamic var move2: Move
	@objc dynamic var move3: Move
	@objc dynamic var move4: Move
	@objc dynamic var item: Item
	
	@objc dynamic var statBoosts: [String: Double]
	
	@objc dynamic var monSprite: UIImage
	//override init
	override init() {
		num = 0
		species = "Missingno"
		types = ["Normal", "Flying"]
		baseStats = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		abilities = ["None"]
		
		level = 100
		nature = "Mild"
		ability = "Undefined"
		iVs = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		eVs = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		actualStats = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		virtualStats = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		move1 = Move()
		move2 = Move()
		move3 = Move()
		move4 = Move()
		item = Item()
		
		statBoosts = ["atk": 1.0, "def": 1.0, "spa": 1.0, "spd": 1.0, "spe": 1.0]
		
		monSprite = UIImage(named: "0.png")!
		
		super.init()
	}
	// initialization from createDex
	init(num: Int, species: String, types: [String], baseStats: [String: Int], abilities: [String]) {
		self.num = num
		self.species = species
		self.types = types
		self.baseStats = baseStats
		self.abilities = abilities
		
		self.level = 0
		self.nature = ""
		self.ability = ""
		self.iVs = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		self.eVs = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		// change this to function calculating stats after creating method calcStats
		self.actualStats = baseStats
		self.virtualStats = baseStats
		self.move1 = Move()
		self.move2 = Move()
		self.move3 = Move()
		self.move4 = Move()
		self.item = Item()
		
		self.statBoosts = ["atk": 1.0, "def": 1.0, "spa": 1.0, "spd": 1.0, "spe": 1.0]
		
		self.monSprite = UIImage(named: dexNumToSpriteUsingNum(num)!)!
		
		super.init()
	}
	// initialization from ?? creating a specific mon for team << ex.
	init(species: String, level: Int, nature: String, ability: String, iVs: [String: Int], eVs: [String: Int], move1: Move, move2: Move, move3: Move, move4: Move, item: Item) {
		self.num = Dex.searchDex(searchParam: species)[0].num
		self.species = species
		self.types = Dex.searchDex(searchParam: species)[0].types
		self.baseStats = Dex.searchDex(searchParam: species)[0].baseStats
		self.abilities = Dex.searchDex(searchParam: species)[0].abilities
		
		self.level = level
		self.nature = nature
		self.ability = ability
		self.iVs = iVs
		self.eVs = eVs
		// change this to function calculating stats after creating method calcStats
		self.actualStats = baseStats
		self.virtualStats = baseStats
		self.move1 = move1
		self.move2 = move2
		self.move3 = move3
		self.move4 = move4
		self.item = item
		
		self.statBoosts = ["atk": 1.0, "def": 1.0, "spa": 1.0, "spd": 1.0, "spe": 1.0]
		
		self.monSprite = UIImage(named: dexNumToSpriteUsingSpecies(species)!)!
		
		super.init()
	}
	
	// Methods for Pokemon
	func getPokemonWeaknesses(pokemonName: Pokemon) -> [String: Int] {
		
		var pokemonWeakness = ["Bug": 0,
							   "Dark": 0,
							   "Dragon": 0,
							   "Electric": 0,
							   "Fairy": 0,
							   "Fighting": 0,
							   "Fire": 0,
							   "Flying": 0,
							   "Ghost": 0,
							   "Grass": 0,
							   "Ground": 0,
							   "Ice": 0,
							   "Normal": 0,
							   "Poison": 0,
							   "Psychic": 0,
							   "Rock": 0,
							   "Steel": 0,
							   "Water": 0]
		
		let neutral = 0
		let weak = 1
		let resist = 2
		let immune = 3
		
		var immunities = [String]()
		
		let type1Chart: [String: Int] = Dex.typeMatchups[pokemonName.types[0]]!
		for (type, effectiv) in type1Chart {
			if effectiv == weak {
				pokemonWeakness[type] = 2
			} else if effectiv == resist {
				pokemonWeakness[type] = -2
			} else if effectiv == immune {
				immunities.append(type)
				pokemonWeakness[type] = 0
			} else if effectiv == neutral {
				pokemonWeakness[type] = 1
			}
		}
		if pokemonName.types.count > 1 {
			let type2Chart: [String: Int] = Dex.typeMatchups[pokemonName.types[1]]!
			for (type, effectiv) in type2Chart {
				if effectiv == weak {
					if pokemonWeakness[type]! != 0 {
						if pokemonWeakness[type]! + 2 == 0 {
							pokemonWeakness[type] = 1
						} else if pokemonWeakness[type]! + 2 == 3 {
							pokemonWeakness[type] = 2
						} else {
							pokemonWeakness[type] = pokemonWeakness[type]! + 2
						}
					}
				} else if effectiv == resist {
					if pokemonWeakness[type]! != 0 {
						if pokemonWeakness[type]! - 2 == 0 {
							pokemonWeakness[type] = 1
						} else if pokemonWeakness[type]! - 2 == -1 {
							pokemonWeakness[type] = -2
						} else {
							pokemonWeakness[type] = pokemonWeakness[type]! - 2
						}
					}
				} else if effectiv == immune {
					immunities.append(type)
					pokemonWeakness[type] = 0
				}
			}
		}
		if pokemonName.ability == "Levitate" {
			pokemonWeakness["Ground"] = 0
		} else if pokemonName.ability == "Flash Fire" {
			pokemonWeakness["Fire"] = 0
		} else if pokemonName.ability == "Volt Absorb" || pokemonName.ability == "Motor Drive" || pokemonName.ability == "Lightningrod" {
			pokemonWeakness["Electric"] = 0
		} else if pokemonName.ability == "Water Absorb" || pokemonName.ability == "Storm Drain" || pokemonName.ability == "Dry Skin" {
			pokemonWeakness["Water"] = 0
		} else if pokemonName.ability == "Sap Sipper" {
			pokemonWeakness["Grass"] = 0
		}
		for (type, _) in pokemonWeakness {
			if immunities.contains(type) {
				pokemonWeakness[type] = 0
			}
		}
		
		// Weakness Dictionary values: -4,-2,0,1,2,4 = x4 resist, resist, immune, neutral, weak, x4 weak
		return pokemonWeakness
	}
	
	// creating method for calculating actual stats
	static func calcStats(pokemon: Pokemon) -> [String: Int] {
		let nature: String = pokemon.nature.lowercased()
		let baseStats: [String: Int] = pokemon.baseStats
		var ivs = pokemon.iVs
		var evs = pokemon.eVs
		let level = pokemon.level
		var actualStats: [String: Int] = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		
		for (stat, value) in baseStats {
			var statMod: Double = 1.0
			let eScalar = Double(evs[stat]! / 4)
			let baseStatCalc: Double = (2.0 * Double(value) + Double(ivs[stat]!) + eScalar)
			//var levelScalar: Double = (Double(level) / 100.0 + 5.0)
			if (Dex.natureList[nature]![stat] != nil) {
				statMod = Dex.natureList[nature]![stat]!
			}
			if stat == "hp" {
				actualStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + Double(level) + 10.0)))
			} else {
				actualStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + 5.0) * statMod))
			}
		}
		return actualStats
	}
	
	func calcStatsMutating() {
		let pokemon: Pokemon = self
		let nature: String = pokemon.nature.lowercased()
		let baseStats: [String: Int] = pokemon.baseStats
		var ivs = pokemon.iVs
		var evs = pokemon.eVs
		let level = pokemon.level
		var actualStats: [String: Int] = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		
		for (stat, value) in baseStats {
			var statMod: Double = 1.0
			let eScalar = Double(evs[stat]! / 4)
			let baseStatCalc: Double = (2.0 * Double(value) + Double(ivs[stat]!) + eScalar)
			//var levelScalar: Double = (Double(level) / 100.0 + 5.0)
			if (Dex.natureList[nature]![stat] != nil) {
				statMod = Dex.natureList[nature]![stat]!
			}
			if stat == "hp" {
				actualStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + Double(level) + 10.0)))
			} else {
				actualStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + 5.0) * statMod))
			}
		}
		self.actualStats = actualStats
		
	}
	
	//calc Max virtual stat values for Level indicators
	static func calcMaxStats() -> [String: Int] {
		let natureMod: Double = 1.1
		let level: Int = 100
		let baseStats: [String: Int] = ["hp": 255, "atk": 190, "def": 230, "spa": 194, "spd": 230, "spe": 255]
		let ivs: [String: Int] = ["hp": 31, "atk": 31, "def": 31, "spa": 31, "spd": 31, "spe": 31]
		let evs: [String: Int] = ["hp": 255, "atk": 255, "def": 255, "spa": 255, "spd": 255, "spe": 255]
		var maxStats: [String: Int] = ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0]
		for (stat, value) in baseStats {
			let eScalar = Double(evs[stat]! / 4)
			let baseStatCalc: Double = (2.0 * Double(value) + Double(ivs[stat]!) + eScalar)
			if stat == "hp" {
				maxStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + Double(level) + 10.0) * 1.5))
			} else {
				maxStats[stat] = Int.init(Double((baseStatCalc * Double(level) / 100.0 + 5.0) * natureMod * 1.5))
			}
			
		}
		
		return maxStats
	}
	//calc virtual stats
	static func calcVirtualStats(pokemon: Pokemon) -> [String: Int] {
		var virtuallyAlteredStats = [String]()
		let actualStats: [String: Int] = pokemon.actualStats
		var virtualStats: [String: Int] = actualStats
		//check for virtual stats
		if pokemon.item.statMods != ["": 1.0] {
			//			pokemon.virtualStats = pokemon.actualStats
			for (stat, value) in pokemon.item.statMods {
				virtualStats[stat] = Int.init(Double(virtualStats[stat]!) * value)
				virtuallyAlteredStats.append(stat) //this does nothing right now
			}
		}
		// begin the exception line here
		if pokemon.ability == "Huge Power" || pokemon.ability == "Pure Power" {
			pokemon.statBoosts["atk"] = pokemon.statBoosts["atk"]! * 2.0
		}
		let boostSum: Double = pokemon.statBoosts["atk"]! + pokemon.statBoosts["def"]! + pokemon.statBoosts["spa"]! + pokemon.statBoosts["spd"]! + pokemon.statBoosts["spe"]!
		if boostSum != 5.0 {
			for (stat, boostMult) in pokemon.statBoosts {
				virtualStats[stat] = Int.init(Double(virtualStats[stat]!) * boostMult)
			}
		}
		
		return virtualStats
		//make something return an array of altered virtual stats for text color!!!-----Reminder!!!!!
	}
	
	func calcVirtualStatsMutating() {
		let pokemon: Pokemon = self
		var virtuallyAlteredStats = [String]()
		let actualStats: [String: Int] = pokemon.actualStats
		var virtualStats: [String: Int] = actualStats
		//check for virtual stats
		if pokemon.item.statMods != ["": 1.0] {
			//			pokemon.virtualStats = pokemon.actualStats
			for (stat, value) in pokemon.item.statMods {
				virtualStats[stat] = Int.init(Double(virtualStats[stat]!) * value)
				virtuallyAlteredStats.append(stat) //this does nothing right now
			}
		}
		// begin the exception line here
		if pokemon.ability == "Huge Power" || pokemon.ability == "Pure Power" {
			pokemon.statBoosts["atk"] = pokemon.statBoosts["atk"]! * 2.0
		}
		let boostSum: Double = pokemon.statBoosts["atk"]! + pokemon.statBoosts["def"]! + pokemon.statBoosts["spa"]! + pokemon.statBoosts["spd"]! + pokemon.statBoosts["spe"]!
		if boostSum != 5.0 {
			for (stat, boostMult) in pokemon.statBoosts {
				virtualStats[stat] = Int.init(Double(virtualStats[stat]!) * boostMult)
			}
		}
		
		self.virtualStats = virtualStats
		//make something return an array of altered virtual stats for text color!!!-----Reminder!!!!!
	}
	//determine multipliers for drawing stat rectangles
	func determineMultipliersForStatRectangles() -> [String: CGFloat] {
		let baseStats = self.baseStats
		var multiplierDict: [String: CGFloat] = [:]
		
		for (stat, value) in baseStats {
			switch (stat) {
			case "hp":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(255))
			case "atk":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(190))
			case "def":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(230))
			case "spa":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(194))
			case "spd":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(230))
			case "spe":
				multiplierDict[stat] = CGFloat.init(Double.init(value) / Double.init(180))
			default:
				print("something went wrong with multiplier switch")
			}
		}
		return multiplierDict
	}
	// method to calc BST
	static func calcBST(pokemon: Pokemon) -> Int {
		var bst = 0
		for (_, value) in pokemon.baseStats {
			bst += value
		}
		return bst
	}
	// method to pull mon learnset array
	func getPokemonLearnset(pokemon: Pokemon) -> [String] {
		var learnsetSearchName: String = pokemon.species.lowercased()
		
		if learnsetSearchName.contains(" ") {
			let index = learnsetSearchName.firstIndex(of: " ")
			let index2 = learnsetSearchName.index(after: index!)
			let learnsetName = learnsetSearchName.prefix(upTo: index!) + learnsetSearchName[index2...]
			learnsetSearchName = String(learnsetName)
		}
		
		if learnsetSearchName.contains("-mega") {
			let suffIndex = learnsetSearchName.firstIndex(of: "-")
			let learnsetName = learnsetSearchName.prefix(upTo: suffIndex!)
			learnsetSearchName = String(learnsetName)
			//		} else if learnsetSearchName.contains("-alola") {
			//			let suffIndex = learnsetSearchName.firstIndex(of: "-")
			//			let learnsetName = learnsetSearchName.prefix(upTo: suffIndex!)
			//			learnsetSearchName = String(learnsetName)
		} else if learnsetSearchName.contains("-therian") {
			let suffIndex = learnsetSearchName.firstIndex(of: "-")
			let learnsetName = learnsetSearchName.prefix(upTo: suffIndex!)
			learnsetSearchName = String(learnsetName)
		} else if learnsetSearchName.contains("-") {
			let index = learnsetSearchName.firstIndex(of: "-")
			let index2 = learnsetSearchName.index(after: index!)
			let learnsetName = learnsetSearchName.prefix(upTo: index!) + learnsetSearchName[index2...]
			learnsetSearchName = String(learnsetName)
		}
		let learnset = Learnsets.learnsets[learnsetSearchName]
		return learnset!
	}
}





class Move: NSObject  {
	@objc dynamic var accuracy: Int
	@objc dynamic var basePower: Int
	@objc dynamic var category: String
	@objc dynamic var desc: String?
	@objc dynamic var shortDesc: String?
	// concatenated string form of move name = id
	@objc dynamic var id: String
	@objc dynamic var name: String
	@objc dynamic var priority: Int
	@objc dynamic var forceSwitch: Bool
	@objc dynamic var target: String
	@objc dynamic var type: String
	
	override init() {
		accuracy = 0
		basePower = 0
		category = "Physical"
		desc = "Default placeholder value for description of move."
		shortDesc = "Short description placeholder."
		id = "toxic"
		name = "Struggle"
		priority = 0
		forceSwitch = false
		target = "normal"
		type = "Normal"
		
		super.init()
	}
	init(accuracy: Int, basePower: Int, category: String, desc: String, shortDesc: String, id: String, name: String, priority: Int, forceSwitch: Bool, target: String, type: String) {
		self.accuracy = accuracy
		self.basePower = basePower
		self.category = category
		self.desc = desc
		self.shortDesc = shortDesc
		self.id = id
		self.name = name
		self.priority = priority
		self.forceSwitch = forceSwitch
		self.target = target
		self.type = type
		
		super.init()
	}
	init(id: String) {
		let move = MoveDex.searchMovedex(searchParam: id)
		
		self.accuracy = move.accuracy
		self.basePower = move.basePower
		self.category = move.category
		//		self.desc = move.desc
		//		self.shortDesc = move.shortDesc
		self.id = move.id
		self.name = move.name
		self.priority = move.priority
		self.forceSwitch = move.forceSwitch
		self.target = move.target
		self.type = move.type
		
		super.init()
	}
	
}



class Item: NSObject {
	@objc dynamic var id: String //concatenated string form of item name
	@objc dynamic var name: String
	@objc dynamic var statMods: [String: Double]
	@objc dynamic var desc: String
	
	override init() {
		id = "imagiberry"
		name = "Imagi Berry"
		statMods = ["": 1.0]
		desc = "An imaginary berry"
		
		super.init()
	}
	init(id: String, name: String, statMods: [String: Double], desc: String) {
		self.id = id
		self.name = name
		self.statMods = statMods
		self.desc = desc
		
		super.init()
	}
}
