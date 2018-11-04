//
//  TeamWeaknessTableViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/25/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class TeamWeaknessTableViewController: UITableViewController {

//	internal let refreshControl = UIRefreshControl()
	private let refreshTableControl = UIRefreshControl()
	
	var team: Team = teamMaster {
		didSet {
//			refreshUI()
			updateView()
		}
	}
	
	var suggestedMons: [Pokemon] = findSuggestedMons(team: teamMaster)
	
	@IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
	
	@IBOutlet var teamWeaknessTableView: UITableView!
	
	var teamSectionToDisplay: String? {
		didSet {
//			refreshUI()
			updateView()
		}
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//		refreshUI()
		suggestedMons = findSuggestedMons(team: teamMaster)
		setupView()
		fetchTeamData()
		refreshTableControl.addTarget(self, action: #selector(refreshTeamData(_:)), for: .valueChanged)
    }

    // MARK: - Table view data source
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		if teamSectionToDisplay == "Team Weaknesses" {
			return 2
		} else if teamSectionToDisplay == "Team Coverage" {
			return 1
		} else { return 1 }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		if teamSectionToDisplay == "Team Weaknesses" {
			switch (section) {
			case 1:
				return team.members.count
			case 2:
				return 1
			default:
				print("Something went wrong with static cell switch")
				return 1
			}
		} else if teamSectionToDisplay == "Team Coverage" {
			return 1
		} else if teamSectionToDisplay == "Team Attributes" {
			return 1
		} else if teamSectionToDisplay == "Suggested Mons" {
			if suggestedMons.count > 0 {
				return suggestedMons.count
			} else { return 1 }
		} else { return 1 }
		
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
	//set modular row height varying by section to display
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if teamSectionToDisplay == "Team Weaknesses" {
			return 90.0
		} else if teamSectionToDisplay == "Team Coverage" {
			return 300.0
		} else if teamSectionToDisplay == "Team Attributes" {
			return 180
		} else if teamSectionToDisplay == "Suggested Mons" {
			return 180
		} else { return 90.0 }
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cellIdentifier = ""
		
		if teamSectionToDisplay == "Team Weaknesses" {
			cellIdentifier = "TeamWeaknessTableViewCell"
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
		} else if teamSectionToDisplay == "Team Coverage" {
			cellIdentifier = "TeamCoverageTableViewCell"
			guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamCoverageTableViewCell
				else {
					fatalError("Not an instance of TeamCoverageTableViewCell")
			}
			var teamCoverageImagesDict: [String: [String: UIImage]] = [:]
			let teamCoverageDict = team.determineTeamCoverage()
			
			for (type, effectiveEntry) in teamCoverageDict {
				teamCoverageImagesDict[type] = [:]
				for (coverageType, coverageValue) in effectiveEntry {
					switch coverageValue {
					case false:
						teamCoverageImagesDict[type]![coverageType] = UIImage(named: "redX.png")
					case true:
						teamCoverageImagesDict[type]![coverageType] = UIImage(named: "greenCheck.png")
					
					}
					
				}
			}
			cell.bugCoverageIndicator.image = teamCoverageImagesDict["Bug"]?["Coverage"]
			cell.bugSTABIndicator.image = teamCoverageImagesDict["Bug"]?["STAB"]
			cell.darkCoverageIndicator.image = teamCoverageImagesDict["Dark"]?["Coverage"]
			cell.darkSTABIndicator.image = teamCoverageImagesDict["Dark"]?["STAB"]
			cell.dragonCoverageIndicator.image = teamCoverageImagesDict["Dragon"]?["Coverage"]
			cell.dragonSTABIndicator.image = teamCoverageImagesDict["Dragon"]?["STAB"]
			cell.electricCoverageIndicator.image = teamCoverageImagesDict["Electric"]?["Coverage"]
			cell.electricSTABIndicator.image = teamCoverageImagesDict["Electric"]?["STAB"]
			cell.fairyCoverageIndicator.image = teamCoverageImagesDict["Fairy"]?["Coverage"]
			cell.fairySTABIndicator.image = teamCoverageImagesDict["Fairy"]?["STAB"]
			cell.fightingCoverageIndicator.image = teamCoverageImagesDict["Fighting"]?["Coverage"]
			cell.fightingSTABIndicator.image = teamCoverageImagesDict["Fighting"]?["STAB"]
			cell.fireCoverageIndicator.image = teamCoverageImagesDict["Fire"]?["Coverage"]
			cell.fireSTABIndicator.image = teamCoverageImagesDict["Fire"]?["STAB"]
			cell.flyingCoverageIndicator.image = teamCoverageImagesDict["Flying"]?["Coverage"]
			cell.flyingSTABIndicator.image = teamCoverageImagesDict["Flying"]?["STAB"]
			cell.ghostCoverageIndicator.image = teamCoverageImagesDict["Ghost"]?["Coverage"]
			cell.ghostSTABIndicator.image = teamCoverageImagesDict["Ghost"]?["STAB"]
			cell.grassCoverageIndicator.image = teamCoverageImagesDict["Grass"]?["Coverage"]
			cell.grassSTABIndicator.image = teamCoverageImagesDict["Grass"]?["STAB"]
			cell.groundCoverageIndicator.image = teamCoverageImagesDict["Ground"]?["Coverage"]
			cell.groundSTABIndicator.image = teamCoverageImagesDict["Ground"]?["STAB"]
			cell.iceCoverageIndicator.image = teamCoverageImagesDict["Ice"]?["Coverage"]
			cell.iceSTABIndicator.image = teamCoverageImagesDict["Ice"]?["STAB"]
			cell.normalCoverageIndicator.image = teamCoverageImagesDict["Normal"]?["Coverage"]
			cell.normalSTABIndicator.image = teamCoverageImagesDict["Normal"]?["STAB"]
			cell.poisonCoverageIndicator.image = teamCoverageImagesDict["Poison"]?["Coverage"]
			cell.poisonSTABIndicator.image = teamCoverageImagesDict["Poison"]?["STAB"]
			cell.psychicCoverageIndicator.image = teamCoverageImagesDict["Psychic"]?["Coverage"]
			cell.psychicSTABIndicator.image = teamCoverageImagesDict["Psychic"]?["STAB"]
			cell.rockCoverageIndicator.image = teamCoverageImagesDict["Rock"]?["Coverage"]
			cell.rockSTABIndicator.image = teamCoverageImagesDict["Rock"]?["STAB"]
			cell.steelCoverageIndicator.image = teamCoverageImagesDict["Steel"]?["Coverage"]
			cell.steelSTABIndicator.image = teamCoverageImagesDict["Steel"]?["STAB"]
			cell.waterCoverageIndicator.image = teamCoverageImagesDict["Water"]?["Coverage"]
			cell.waterSTABIndicator.image = teamCoverageImagesDict["Water"]?["STAB"]
			
			return cell
			
		} else if teamSectionToDisplay == "Team Attributes" {
			cellIdentifier = "TeamAttributesTableViewCell"
			guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamAttributesTableViewCell
				else {
					fatalError("Not an instance of TeamAttributesTableViewCell")
			}
			
			let teamAttributes = team.determineAttributes()
			var attributesDict: [String: UIImage] = [:]
			for (attribute, bool) in teamAttributes {
				switch (bool) {
				case true:
					attributesDict[attribute] = UIImage(named: "greenCheck.png")
				case false:
					attributesDict[attribute] = UIImage(named: "redX.png")
				}
			}
			cell.stealthRockBool.image = attributesDict["Stealth Rock"]
			cell.stickywebBool.image = attributesDict["Sticky Web"]
			cell.spikesBool.image = attributesDict["Spikes"]
			cell.lightscreenBool.image = attributesDict["Light Screen"]
			cell.reflectBool.image = attributesDict["Reflect"]
			cell.auroraveilBool.image = attributesDict["Aurora Veil"]
			cell.defogBool.image = attributesDict["Defog"]
			cell.rapidspinBool.image = attributesDict["Rapid Spin"]
			cell.tauntBool.image = attributesDict["Taunt"]
			cell.phaserBool.image = attributesDict["Phaser"]
			
			return cell
			
		} else if teamSectionToDisplay == "Suggested Mons" {
			cellIdentifier = "SuggestedMonTableViewCell"
			guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SuggestedMonTableViewCell
				else {
					fatalError("Not an instance of TeamAttributesTableViewCell")
			}
			
//			suggestedMons = findSuggestedMons(team: team)
//			var mon = suggestedMons[indexPath.row]
			
			cell.suggestedMonImage.image = UIImage(named: "\(suggestedMons[indexPath.row].num).png")
			cell.suggestedMonLabel.text = "\(suggestedMons[indexPath.row].species)"
			
			return cell
			
		} else {
			cellIdentifier = "TeamWeaknessTableViewCell"
			guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamWeaknessTableViewCell
				else {
					fatalError("Not an instance of TeamOverviewTableViewCell")
			}
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
//		self.teamWeaknessTableView.reloadData()
//		teamWeaknessTableView.reloadData()
//		DispatchQueue.main.async {
//			self.teamWeaknessTableView.reloadData()
//		}
	}
	
	private func setupView() {
		setupTableView()
		setupActivityIndicatorView()
	}
	
	private func setupTableView() {
		teamWeaknessTableView.refreshControl = refreshTableControl
	}
	
	private func setupActivityIndicatorView() {
		self.activityIndicatorView.hidesWhenStopped = true
		activityIndicatorView.startAnimating()
	}
	
	private func updateView() {
		teamWeaknessTableView.reloadData()
	}
	
	func fetchTeamData() {
		print("Fetching team Data")
		
		self.team = teamMaster
		self.suggestedMons = findSuggestedMons(team: self.team)
		self.updateView()
		self.refreshTableControl.endRefreshing()
		self.activityIndicatorView.stopAnimating()
		
	}
	
	@objc private func refreshTeamData(_ sender: Any) {
		fetchTeamData()
	}
	
}




extension TeamWeaknessTableViewController: TeamSectionSelectionDelegate {
	func sectionSelected(_ newSection: String) {
		teamSectionToDisplay = newSection
	}
	func updateTeam(_ updatedTeam: Team) {
		team = updatedTeam
//		self.teamWeaknessTableView.reloadData()
		
		print("team updated")
	}
}
