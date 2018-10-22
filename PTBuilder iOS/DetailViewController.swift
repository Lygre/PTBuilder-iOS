//
//  DetailViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/22/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var pokemonNameLabel: UILabel!
	@IBOutlet weak var spriteImageView: UIImageView!
	
	
	
	var pokemon: Pokemon? {
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
		loadViewIfNeeded()
		pokemonNameLabel.text = pokemon?.species
		spriteImageView.image = pokemon?.monSprite
		
	}
	
	
	
	
}

extension DetailViewController: PokemonSelectionDelegate {
	func pokemonSelected(_ newPokemon: Pokemon) {
		pokemon = newPokemon
	}
}
