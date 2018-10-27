//
//  TeamWeaknessTableViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/25/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class TeamWeaknessTableViewController: UITableViewController {

	var team: Team = teamMaster
	
	
	@IBOutlet var teamWeaknessTableView: UITableView!
	
	var teamSectionToDisplay: String? {
		didSet {
			refreshUI()
		}
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
		refreshUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		switch (section) {
		case 1:
			return team.members.count
		case 2:
			return 1
		default:
			print("Something went wrong with static cell switch")
			return 1
		}
		
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "TeamWeaknessTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamWeaknessTableViewCell
			else {
				fatalError("Not an instance of TeamOverviewTableViewCell")
		}
		switch (indexPath.section) {
		// Configure the cell...
		case 1:
			let monImage = UIImage(named: "\(team.members[indexPath.row].num).png")
			cell.monImageView.image = monImage ?? UIImage(named: "defaultPhoto")
			
			let mon = team.members[indexPath.row]
			let monWeaknesses = mon.getPokemonWeaknesses(pokemonName: mon)
			var weaknessToImageDict: [String: UIImage] = [:]
		
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
					print("Problem with vector to image switch")
				}
			
			}
			cell.bugEfficacyImage.image = weaknessToImageDict["Bug"]
			cell.darkEfficacyImage.image = weaknessToImageDict["Dark"]
			cell.dragonEfficacyImage.image = weaknessToImageDict["Dragon"]
			cell.electricEfficacyImage.image = weaknessToImageDict["Electric"]
			cell.fairyEfficacyImage.image = weaknessToImageDict["Fairy"]
			cell.fightingEfficacyImage.image = weaknessToImageDict["Fighting"]
			cell.fireEfficacyImage.image = weaknessToImageDict["Fire"]
			cell.flyingEfficacyImage.image = weaknessToImageDict["Flying"]
			cell.ghostEfficacyImage.image = weaknessToImageDict["Ghost"]
			cell.grassEfficacyImage.image = weaknessToImageDict["Grass"]
			cell.groundEfficacyImage.image = weaknessToImageDict["Ground"]
			cell.iceEfficacyImage.image = weaknessToImageDict["Ice"]
			cell.normalEfficacyImage.image = weaknessToImageDict["Normal"]
			cell.poisonEfficacyImage.image = weaknessToImageDict["Poison"]
			cell.psychicEfficacyImage.image = weaknessToImageDict["Psychic"]
			cell.rockEfficacyImage.image = weaknessToImageDict["Rock"]
			cell.steelEfficacyImage.image = weaknessToImageDict["Steel"]
			cell.waterEfficacyImage.image = weaknessToImageDict["Water"]
			
			return cell
			
		case 0:
//			let teamWeaknessCumulativeDict = team.determineCumulativeTeamWeaknessesUsingDoubles()
			var weaknessToImageDict = team.determineCumulativeInteractionIconTable()
			
			cell.monImageView.image = UIImage(named: "PokeballIcon.png")
			
			cell.bugEfficacyImage.image = weaknessToImageDict["Bug"]
			cell.darkEfficacyImage.image = weaknessToImageDict["Dark"]
			cell.dragonEfficacyImage.image = weaknessToImageDict["Dragon"]
			cell.electricEfficacyImage.image = weaknessToImageDict["Electric"]
			cell.fairyEfficacyImage.image = weaknessToImageDict["Fairy"]
			cell.fightingEfficacyImage.image = weaknessToImageDict["Fighting"]
			cell.fireEfficacyImage.image = weaknessToImageDict["Fire"]
			cell.flyingEfficacyImage.image = weaknessToImageDict["Flying"]
			cell.ghostEfficacyImage.image = weaknessToImageDict["Ghost"]
			cell.grassEfficacyImage.image = weaknessToImageDict["Grass"]
			cell.groundEfficacyImage.image = weaknessToImageDict["Ground"]
			cell.iceEfficacyImage.image = weaknessToImageDict["Ice"]
			cell.normalEfficacyImage.image = weaknessToImageDict["Normal"]
			cell.poisonEfficacyImage.image = weaknessToImageDict["Poison"]
			cell.psychicEfficacyImage.image = weaknessToImageDict["Psychic"]
			cell.rockEfficacyImage.image = weaknessToImageDict["Rock"]
			cell.steelEfficacyImage.image = weaknessToImageDict["Steel"]
			cell.waterEfficacyImage.image = weaknessToImageDict["Water"]
			
			return cell
			
			
		default:
			return cell
		}
	}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	func refreshUI() {
		
	}
	
}

extension TeamWeaknessTableViewController: TeamSectionSelectionDelegate {
	func sectionSelected(_ newSection: String) {
		teamSectionToDisplay = newSection
	}
	func updateTeam(_ updatedTeam: Team) {
		team = updatedTeam
	}
}
