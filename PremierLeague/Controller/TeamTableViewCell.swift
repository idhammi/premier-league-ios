//
//  TeamTableViewCell.swift
//  PremierLeague
//
//  Created by Idham on 29/06/21.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoTeam: UIImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var descTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
