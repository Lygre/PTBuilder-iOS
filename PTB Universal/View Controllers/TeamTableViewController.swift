//
//  TeamTableViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/24/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

	var team: Team = teamMaster
	var teamDetailViewController: TeamDetailViewController?
	var teamSections: [String] = ["Team Weaknesses", "Team Coverage", "Team Attributes", "Suggested Mons"]
//	var delegate: TeamOverviewDelegate?
	
	@IBOutlet var teamOverviewTableView: UITableView!
	
	var selectedSection: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        return teamSections.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "TeamOverviewTableViewCell"
		
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamOverviewTableViewCell
			else {
				fatalError("Not an instance of TeamOverviewTableViewCell")
		}
		
        // Configure the cell...
		let labelName = teamSections[indexPath.row]
		cell.teamOverviewSectionLabel.text = labelName
		
        return cell
    }
	

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedSection = teamSections[indexPath.row]
		performSegue(withIdentifier: "showTeamOverview", sender: TeamOverviewTableViewCell.self)
//		presenter.pushViewController(rootTV, animated: true)
		//		presenter?.sectionSelected(selectedSection)
		
		
		
		
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

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
		if segue.destination is UINavigationController {
			let detailNavController = segue.destination as! UINavigationController
			let viewControllers = detailNavController.viewControllers
			print(viewControllers.debugDescription)
			let teamOverViewDetail = detailNavController.viewControllers[0] as! TeamWeaknessTableViewController
			teamOverViewDetail.teamWeaknessTableView = UITableView()
			teamOverViewDetail.teamSectionToDisplay = self.selectedSection
		}
		
    }
	

}
