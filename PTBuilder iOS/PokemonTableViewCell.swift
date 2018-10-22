//
//  PokemonTableViewCell.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 10/21/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

	
	@IBOutlet weak var pokemonNameLabel: UILabel!
	@IBOutlet weak var pokemonImageView: UIImageView!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	
	
	
	
	
}
