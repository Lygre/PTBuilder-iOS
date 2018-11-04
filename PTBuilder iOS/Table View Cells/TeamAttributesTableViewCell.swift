//
//  TeamAttributesTableViewCell.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/3/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class TeamAttributesTableViewCell: UITableViewCell {

	@IBOutlet weak var stealthRockBool: UIImageView!
	@IBOutlet weak var spikesBool: UIImageView!
	@IBOutlet weak var stickywebBool: UIImageView!
	@IBOutlet weak var lightscreenBool: UIImageView!
	@IBOutlet weak var reflectBool: UIImageView!
	@IBOutlet weak var auroraveilBool: UIImageView!
	@IBOutlet weak var defogBool: UIImageView!
	@IBOutlet weak var rapidspinBool: UIImageView!
	@IBOutlet weak var tauntBool: UIImageView!
	@IBOutlet weak var phaserBool: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
