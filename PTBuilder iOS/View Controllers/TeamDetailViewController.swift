//
//  TeamDetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/24/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

struct teamDataEntry {
	var teamWeaknessTable: [(String, Int)]?
}

class TeamDetailViewController: UIViewController {

//	fileprivate let reuseIdentifier = "TeamCell"
//
//	fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
//
//	fileprivate var dataEntries = [String: Any]()
//
	@IBOutlet weak var sectionLabel: UILabel!
	
	@IBOutlet weak var typeImage1: UIImageView!
	@IBOutlet weak var typeImage2: UIImageView!
	@IBOutlet weak var typeImage3: UIImageView!
	@IBOutlet weak var typeImage4: UIImageView!
	@IBOutlet weak var typeImage5: UIImageView!
	@IBOutlet weak var typeImage6: UIImageView!
	@IBOutlet weak var typeImage7: UIImageView!
	@IBOutlet weak var typeImage8: UIImageView!
	@IBOutlet weak var typeImage9: UIImageView!
	@IBOutlet weak var typeImage10: UIImageView!
	@IBOutlet weak var typeImage11: UIImageView!
	@IBOutlet weak var typeImage12: UIImageView!
	@IBOutlet weak var typeImage13: UIImageView!
	@IBOutlet weak var typeImage14: UIImageView!
	@IBOutlet weak var typeImage15: UIImageView!
	@IBOutlet weak var typeImage16: UIImageView!
	@IBOutlet weak var typeImage17: UIImageView!
	@IBOutlet weak var typeImage18: UIImageView!
	
	@IBOutlet weak var susceptibilityVectorLabel1: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel2: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel3: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel4: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel5: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel6: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel7: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel8: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel9: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel10: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel11: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel12: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel13: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel14: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel15: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel16: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel17: UILabel!
	@IBOutlet weak var susceptibilityVectorLabel18: UILabel!
	
	
	var team: Team = teamMaster
	
	
	
	var teamSectionToDisplay: String? {
		didSet {
			refreshUI()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
		switch teamSectionToDisplay {
		case "Team Weaknesses":
			sectionLabel.text = teamSectionToDisplay ?? "Error"
			typeImage1.image = UIImage(named: "Bug")
			typeImage2.image = UIImage(named: "Dark")
			typeImage3.image = UIImage(named: "Dragon")
			typeImage4.image = UIImage(named: "Electric")
			typeImage5.image = UIImage(named: "Fairy")
			typeImage6.image = UIImage(named: "Fighting")
			typeImage7.image = UIImage(named: "Fire")
			typeImage8.image = UIImage(named: "Flying")
			typeImage9.image = UIImage(named: "Ghost")
			typeImage10.image = UIImage(named: "Grass")
			typeImage11.image = UIImage(named: "Ground")
			typeImage12.image = UIImage(named: "Ice")
			typeImage13.image = UIImage(named: "Normal")
			typeImage14.image = UIImage(named: "Poison")
			typeImage15.image = UIImage(named: "Psychic")
			typeImage16.image = UIImage(named: "Rock")
			typeImage17.image = UIImage(named: "Steel")
			typeImage18.image = UIImage(named: "Water")
			typeImage1.image?.accessibilityIdentifier = "Bug"
			typeImage2.image?.accessibilityIdentifier = "Dark"
			typeImage3.image?.accessibilityIdentifier = "Dragon"
			typeImage4.image?.accessibilityIdentifier = "Electric"
			typeImage5.image?.accessibilityIdentifier = "Fairy"
			typeImage6.image?.accessibilityIdentifier = "Fighting"
			typeImage7.image?.accessibilityIdentifier = "Fire"
			typeImage8.image?.accessibilityIdentifier = "Flying"
			typeImage9.image?.accessibilityIdentifier = "Ghost"
			typeImage10.image?.accessibilityIdentifier = "Grass"
			typeImage11.image?.accessibilityIdentifier = "Ground"
			typeImage12.image?.accessibilityIdentifier = "Ice"
			typeImage13.image?.accessibilityIdentifier = "Normal"
			typeImage14.image?.accessibilityIdentifier = "Poison"
			typeImage15.image?.accessibilityIdentifier = "Psychic"
			typeImage16.image?.accessibilityIdentifier = "Rock"
			typeImage17.image?.accessibilityIdentifier = "Steel"
			typeImage18.image?.accessibilityIdentifier = "Water"
			
			team.determineTeamWeaknesses()
			
			susceptibilityVectorLabel1.text = "\(team.teamWeaknesses["Bug"]!)"
			susceptibilityVectorLabel2.text = "\(team.teamWeaknesses["Dark"]!)"
			susceptibilityVectorLabel3.text = "\(team.teamWeaknesses["Dragon"]!)"
			susceptibilityVectorLabel4.text = "\(team.teamWeaknesses["Electric"]!)"
			susceptibilityVectorLabel5.text = "\(team.teamWeaknesses["Fairy"]!)"
			susceptibilityVectorLabel6.text = "\(team.teamWeaknesses["Fighting"]!)"
			susceptibilityVectorLabel7.text = "\(team.teamWeaknesses["Fire"]!)"
			susceptibilityVectorLabel8.text = "\(team.teamWeaknesses["Flying"]!)"
			susceptibilityVectorLabel9.text = "\(team.teamWeaknesses["Ghost"]!)"
			susceptibilityVectorLabel10.text = "\(team.teamWeaknesses["Grass"]!)"
			susceptibilityVectorLabel11.text = "\(team.teamWeaknesses["Ground"]!)"
			susceptibilityVectorLabel12.text = "\(team.teamWeaknesses["Ice"]!)"
			susceptibilityVectorLabel13.text = "\(team.teamWeaknesses["Normal"]!)"
			susceptibilityVectorLabel14.text = "\(team.teamWeaknesses["Poison"]!)"
			susceptibilityVectorLabel15.text = "\(team.teamWeaknesses["Psychic"]!)"
			susceptibilityVectorLabel16.text = "\(team.teamWeaknesses["Rock"]!)"
			susceptibilityVectorLabel17.text = "\(team.teamWeaknesses["Steel"]!)"
			susceptibilityVectorLabel18.text = "\(team.teamWeaknesses["Water"]!)"

			print(team.teamWeaknesses)
		case "Team Coverage":
			sectionLabel.text = teamSectionToDisplay ?? "Error"
			team.determineTeamCoverage()
			
		case "Team Attributes":
			print("omg")
			sectionLabel.text = teamSectionToDisplay ?? "Error"
		case "Suggested Mons":
			print("oh we not here yet")
			sectionLabel.text = teamSectionToDisplay ?? "Error"
		default:
			print("Something wrong with teamSection detail switch")
		}


	}
	
}

extension TeamDetailViewController: TeamSectionSelectionDelegate {
	func updateTeam(_ updatedTeam: Team) {
		team = updatedTeam
	}
	
	func sectionSelected(_ newSection: String) {
		teamSectionToDisplay = newSection
	}
}

//extension TeamDetailViewController {
//	//1
//	override func numberOfSections(in collectionView: UICollectionView) -> Int {
//		return dataEntries.count
//	}
//
//	//2
//	override func collectionView(_ collectionView: UICollectionView,
//								 numberOfItemsInSection section: Int) -> Int {
//		return searches[section].searchResults.count
//	}
//
//	//3
//	override func collectionView(_ collectionView: UICollectionView,
//								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
//													  for: indexPath)
//		cell.backgroundColor = UIColor.black
//		// Configure the cell
//		return cell
//	}
//}
//
//private extension TeamDetailViewController {
//	func dataForIndexPath(indexPath: IndexPath) -> teamDataEntry {
//		return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
//	}
//}
