//
//  LaunchesTableViewCell.swift
//  Space_X
//
//  Created by Ahmet Balaman on 15.08.2023.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var missionPatchImage: UIImageView!
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var flightNumber: UILabel!
    
    @IBOutlet weak var missionName: UILabel!
    
    @IBOutlet weak var launchYear: UILabel!
    
    @IBOutlet weak var launchDetail: UILabel!
    
    @IBOutlet weak var rocketName: UILabel!
    
    @IBOutlet weak var rocketType: UILabel!
    
    @IBOutlet weak var coreSerial: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier = "LaunchesTableViewCell"
    
    
    static func nib() -> UINib {
        return UINib(nibName: "LaunchesTableViewCell" , bundle: nil)
    }
}
