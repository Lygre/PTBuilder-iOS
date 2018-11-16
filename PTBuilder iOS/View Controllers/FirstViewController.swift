//
//  FirstViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/20/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

var teamMaster: Team = Team()

var selectedDetailMember: Pokemon? = Pokemon()

var selectedDetailMember2: Pokemon? = Pokemon()

class FirstViewController: UIViewController {

	@IBOutlet weak var monSearchField: UITextField!
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var monAddedName: UILabel!
	
	@IBOutlet weak var memberName: UILabel!
	
	var teamViewController: PokemonTableViewController?
	
	@objc dynamic var team = [Pokemon]()
	
	@objc dynamic var team2test = Team()
	
//	@objc dynamic var teamWeaknessTableBind: [String: [String: NSImage]] = [:]
	
	@objc dynamic var teamCoverageTableBind: [String: [String: Bool]] = [:]
	
	@objc dynamic var teamAttributeTableBind: [String: Bool] = [:]
	
//	@objc dynamic var colorTable: [String: NSColor] = ["Weak": NSColor.systemRed,
//													   "Resist": NSColor.systemGreen,
//													   "Neutral": NSColor.systemGray]
//
	@objc dynamic var suggestedMonTableBind = [Pokemon]()
	
	@objc dynamic var itemList = [Item]()
	
	@objc dynamic var learnsetMoves = [Move]()
	
	@objc dynamic var movesToSet = [String: Move]()
	
	@objc dynamic var natureList = [String]()
	
	@objc dynamic var levelArray = [Int]()
	
	
	@objc dynamic var evHPBind = Int()
	@objc dynamic var evATKBind = Int()
	@objc dynamic var evDEFBind = Int()
	@objc dynamic var evSPABind = Int()
	@objc dynamic var evSPDBind = Int()
	@objc dynamic var evSPEBind = Int()
	
	@objc dynamic var evHPMaxValueBind = Double()
	@objc dynamic var evATKMaxValueBind = Double()
	@objc dynamic var evDEFMaxValueBind = Double()
	@objc dynamic var evSPAMaxValueBind = Double()
	@objc dynamic var evSPDMaxValueBind = Double()
	@objc dynamic var evSPEMaxValueBind = Double()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
//		Dex.initializeDex()
//		Dex.defineTypeMatchups()
		MoveDex.initializeMoveDex()
		ItemDex.initializeItemDex()
		for item in ItemDex.itemDexArray {
			itemList.append(item)
		}
		for (nature, _) in Dex.natureList {
			natureList.append(nature)
		}
		natureList.sort()
		repeat {
			levelArray.append(levelArray.count + 1)
		} while levelArray.count < 100
	
		//dismiss keyboard
		self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
		
	}

	@IBAction func searchMonForAdd(_ sender: Any) {
		
		let monToAdd = Dex.searchDex(searchParam: monSearchField.text!)[0]
		//set default level at 100
		print(monSearchField.text!)
		monToAdd.level = 100
		//set default IVs all to 31
		for (stat, _) in monToAdd.iVs {
			monToAdd.iVs[stat] = 31
		}
		monToAdd.nature = "mild"
		//calc actual stats
		monToAdd.actualStats = Pokemon.calcStats(pokemon: monToAdd)
		monToAdd.virtualStats = Pokemon.calcVirtualStats(pokemon: monToAdd)
		//add pokemon object to objc team variable (bound to array controller)
		//-----This can probably go fuck itself
		self.team.append(monToAdd)
		if team2test.members.isEmpty {
			team2test = Team(members: team)
		} else {
			team2test.addMember(monToAdd)
		}
		
		//-----This is the important part now
		monAddedName.text = ""
		for mon in team {
			monAddedName.text = monAddedName.text! + mon.species
		}
		let vc = self.teamViewController
		vc?.addToTeam(pokemon: monToAdd)
		teamMaster.members.append(monToAdd)
	}
	
}

