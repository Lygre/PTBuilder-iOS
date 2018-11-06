//
//  PokemonTableViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/21/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit



class PokemonTableViewController: UITableViewController {

	var team: Team = teamMaster
	var detailViewController: DetailViewController?
	
	var delegate: PokemonSelectionDelegate?
	
	var delegateForTeam: TeamSectionSelectionDelegate?
	
	var pokemon: Pokemon?
	
	@IBOutlet var teamTableView: UITableView!
	
	@IBOutlet weak var teamName: UITextField!
	
	@IBOutlet weak var teamNameTextView: UIView!
	
	@objc dynamic var userDefaults = UserDefaults.standard
	
    override func viewDidLoad() {
        super.viewDidLoad()
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		ItemDex.initializeItemDex()
		MoveDex.initializeMoveDex()
		team = teamMaster
//		loadSamplePokemon()
		self.teamNameTextView.isHidden = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.members.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "PokemonTableViewCell"
	
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PokemonTableViewCell else {
			fatalError("Not an instance of PokemonTableViewCell")
		}
		
		pokemon = team.members[indexPath.row]
		
		cell.pokemonNameLabel.text = pokemon!.species
		cell.pokemonImageView.image = UIImage(named: dexNumToSprite(pokemon!)!)
		
        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedPokemon = team.members[indexPath.row]
		
//		if let detailViewController = delegate as? DetailViewController, let detail
		let presenter = self.splitViewController?.viewControllers.last as? DetailViewController
		presenter?.pokemonSelected(selectedPokemon)
		selectedDetailMember = selectedPokemon
	}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
	override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
		print("oh it was this one")
		team.members.remove(at: indexPath.row)
		tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
		teamMaster = team
		let vc = storyboard?.instantiateViewController(withIdentifier: "teamWeaknessTableController") as? TeamWeaknessTableViewController
//		vc?.updateTeam(team)
//		vc?.fetchTeamData()
	}
	
	/*
    // Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
			print("oh hi")
			team.members.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
	*/
	override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		print("stfu")
		self.teamTableView.endUpdates()
	}

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//		if segue.destination
//    }

	func addToTeam(pokemon: Pokemon) {
//		teamMaster.members.append(pokemon)
		team.members.append(pokemon)
	}
	func exportTeamStandalone() -> String {
		let numberOfTeamMembers = teamTableView.numberOfRows(inSection: 0)
		var output: String = ""
		
		if numberOfTeamMembers > 0 {
			for mon in self.team.members {
				output.append("\(mon.species) @ \(mon.item.name)\n")
				output.append("Ability: \(mon.ability)\n")
				if mon.eVs != ["hp": 0, "atk": 0, "def": 0, "spa": 0, "spd": 0, "spe": 0] {
					var evString: String = "EVs: "
					for (stat, value) in mon.eVs {
						if value != 0 {
							evString.append("\(value) \(stat) - ")
						}
					}
					evString = evString.replacingOccurrences(of: "-", with: "/")
					evString.removeLast(3)
					evString.append("\n")
					output.append(evString)
					
				}
				var natureString: String = "\(mon.nature)"
				natureString = natureString.capitalized
				natureString.append(" Nature\n")
				output.append(natureString)
				
				if mon.iVs != ["hp": 31, "atk": 31, "def": 31, "spa": 31, "spd": 31, "spe": 31] {
					var ivString: String = "IVs: "
					for (stat, value) in mon.iVs {
						if value != 31 {
							ivString.append("\(value) \(stat) - ")
						}
					}
					ivString = ivString.replacingOccurrences(of: "-", with: "/")
					ivString.removeLast(3)
					ivString.append("\n")
					output.append(ivString)
					
				}
				
				//come back later and address IV exceptions here
				output.append("- \(mon.move1.name)\n")
				output.append("- \(mon.move2.name)\n")
				output.append("- \(mon.move3.name)\n")
				output.append("- \(mon.move4.name)\n")
				output.append("\n")
			}
		}
		return output
	}
	
	func saveTeamFromString(teamName: String) {
		let teamToSave: String = self.exportTeamStandalone()
		var savedTeams = userDefaults.dictionary(forKey: "savedTeams") ?? [:]
		savedTeams[teamName] = teamToSave
		userDefaults.setValue(savedTeams, forKey: "savedTeams")
		print(userDefaults.dictionaryRepresentation())
	}
	
	func loadTeam(team: Team) {
		self.team = team
		teamMaster = team
	}
	
	@IBAction func saveTeam(_ sender: Any) {
		self.teamNameTextView.isHidden = false
	}
	
	@IBAction func saveTeamNameEndEditing(_ sender: Any) {
		saveTeamFromString(teamName: teamName.text ?? "hi2")
		self.teamNameTextView.isHidden = true
	}
	
	
	@IBAction func resetSavedTeams(_ sender: Any) {
		UserDefaults.standard.setValue("", forKey: "savedTeams")
	}
	
	
	@IBAction func removeMember(_ sender: Any) {
		let editModeEnabled: Bool = teamTableView.isEditing
		if editModeEnabled == false {
			teamTableView.setEditing(true, animated: true)
		} else {
			teamTableView.setEditing(false, animated: true)
		}
		
//		vc?.teamWeaknessTableView.reloadData()
	}
	
	
	
}
