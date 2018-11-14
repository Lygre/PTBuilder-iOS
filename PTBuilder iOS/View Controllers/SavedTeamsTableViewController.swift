//
//  SavedTeamsTableViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/5/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class SavedTeamsTableViewController: UITableViewController {

	var loadableTeamDictionary: [String: String] = [:]
	
	var loadableTeamArray: [Team] = []
	var selectedTeam: Team?
	
	@IBOutlet var savedTeamsTableView: UITableView!
	
	@objc dynamic var availableTeams = UserDefaults.standard.dictionary(forKey: "savedTeams")
	@objc dynamic var selectedKey = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
		for (key, value) in availableTeams! {
			loadableTeamDictionary[key] = value as? String
		}
		for (_, value) in loadableTeamDictionary {
			loadableTeamArray.append(loadSavedTeam(teamString: value))
		}
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return loadableTeamArray.count
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		selectedTeam = loadableTeamArray[indexPath.row]
		
		
		//		if let detailViewController = delegate as? DetailViewController, let detail
//		let presenter = self.presentingViewController as? PokemonTableViewController
//
//		presenter?.loadTeam(team: selectedTeam)
//		show(presentingViewController!, sender: self)
//		selectedDetailMember = selectedPokemon
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "SavedTeamsTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SavedTeamsTableViewCell else {
			fatalError("Not an instance of SavedTeamsTableViewCell")
		}
		
		let teamForRow: Team = loadableTeamArray[indexPath.row]
		
		cell.savedTeamName.text = "Hi"
		
		var imageDict: [UIImage] = []

		for mon in teamForRow.members {
			imageDict.append(mon.monSprite)
		}
		var numberOfMembers = teamForRow.members.count
		if numberOfMembers < 6 {
			repeat {
				imageDict.append(UIImage(named: "0.png")!)
				numberOfMembers += 1
			} while numberOfMembers < 6
		}
		print(imageDict)
		cell.mon1Image.image = imageDict[0]
		cell.mon2Image.image = imageDict[1]
		cell.mon3Image.image = imageDict[2]
		cell.mon4Image.image = imageDict[3]
		cell.mon5Image.image = imageDict[4]
		cell.mon6Image.image = imageDict[5]

	
		return cell
	}
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

	
    // Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//			deleteSavedTeam()
			deleteSavedTeam(indexPathForTeamInSource: indexPath.row)
			loadableTeamArray.remove(at: indexPath.row)
			
            tableView.deleteRows(at: [indexPath], with: .left)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
	
	func deleteSavedTeam(indexPathForTeamInSource: Int) {
		var savedTeams = UserDefaults.standard.dictionary(forKey: "savedTeams")
		for (teamName, _) in savedTeams! {
			if selectedTeam == loadableTeamArray[indexPathForTeamInSource] {
				savedTeams![teamName] = nil
				availableTeams![teamName] = nil
				UserDefaults.standard.removeObject(forKey: "savedTeams")
				UserDefaults.standard.setValue(savedTeams, forKey: "savedTeams")
			}
			
		}
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

	
	@IBAction func loadSelectedTeam(_ sender: Any) {
		if let teamToLoad = self.selectedTeam {
			teamMaster = teamToLoad
			let masterNavVc = self.splitViewController?.viewControllers[0] as! UINavigationController
			let masterVc = masterNavVc.viewControllers[0] as! PokemonTableViewController
			masterVc.team = teamMaster
			masterVc.refreshTable()
		}
	}
	
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.destination is PrimaryTabBarViewController {
//			let vc = segue.destination as! UISplitViewController
//			let vc2 = vc.viewControllers.first as? PokemonTableViewController
			teamMaster = self.selectedTeam!
		
		}
		
//		if let barVC = segue.destination as? UITabBarController {
//			barVC.viewControllers?.forEach {
//				if let vc = $0 as? PokemonTableViewController {
//					teamMaster = self.selectedTeam!
//					vc.team = self.selectedTeam!
//				}
//			}
//		}
		
		
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
