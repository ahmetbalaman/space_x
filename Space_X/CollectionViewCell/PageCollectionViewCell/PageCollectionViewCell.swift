//
//  PageCollectionViewCell.swift
//  Space_X
//
//  Created by Ahmet Balaman on 11.08.2023.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var pageImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifider = "PageCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PageCollectionViewCell" , bundle: nil)
    }
}
