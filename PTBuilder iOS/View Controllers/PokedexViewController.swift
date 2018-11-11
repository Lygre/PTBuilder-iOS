//
//  PokedexViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/1/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class PokedexViewController: UITableViewController {

//	var detailViewController:
	var pokedex: [Pokemon]?
	var pokemon: Pokemon?
	
	var searchDelegate: UISearchBarDelegate?
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		Dex.initializeDex()
		Dex.defineTypeMatchups()
		pokedex = Dex.dexArray

        // Do any additional setup after loading the view.
    }
	
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pokedex?.count ?? 0
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "PokedexTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PokedexTableViewCell else {
			fatalError("Not an instance of PokedexTableViewCell")
		}
		
		let pokemon = pokedex![indexPath.row]
		
		cell.pokemonName.text = pokemon.species
		cell.pokemonImage.image = UIImage(named: dexNumToSprite(pokemon)!)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedPokemon = pokedex?[indexPath.row]
		let presenter = self.splitViewController?.viewControllers.last as? PokedexDetailViewController
		print(presenter.debugDescription)
		presenter?.pokemonSelected(selectedPokemon!)
		pokemon = selectedPokemon
		selectedDetailMember2 = selectedPokemon
		
		
	}

//	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//	}
	
	
	func calcStatistics(stat: String) {
		var hpArray: [Int] = []
		
		for mon in Dex.dexArray {
			hpArray.append(mon.baseStats[stat] ?? 1)
		}
		hpArray.sort()
		
		let population = hpArray.count
		let median = population/2
		
		var mean: Int? {
			var sum: Int = 0
			for member in hpArray {
				sum += member
			}
			return sum / hpArray.count
		}
		
		var standardDeviation: Double? {
			var squareResults: [Int] = []
			for member in hpArray {
				squareResults.append((member - mean!)*(member - mean!))
			}
			var meanOfSquares: Double {
				var sumOfSquares: Double = 0.00
				for squareMember in squareResults {
					sumOfSquares = sumOfSquares + Double.init(squareMember)
				}
				return sumOfSquares / Double.init(hpArray.count)
			}
			
			return meanOfSquares.squareRoot()
		}
		
		var minValue = hpArray[0]
		var maxValue = hpArray.max()
		print("median: ", hpArray[median], "mean: ", mean as Any, standardDeviation as Any, "minValue: ", minValue, "maxValue: ", maxValue)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PokedexViewController: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
	
	
}
