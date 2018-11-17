//
//  PokedexTableViewCell.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/1/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {

	
	@IBOutlet weak var pokemonImage: UIImageView!
	@IBOutlet weak var pokemonName: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
