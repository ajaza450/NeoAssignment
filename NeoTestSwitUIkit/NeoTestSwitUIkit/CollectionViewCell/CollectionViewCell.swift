//
//  CollectionViewCell.swift
//  NeoTestSwitUIkit
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image:UIImageView!
    
    var imageData: String? {
        didSet {
            configuration()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
    }
    
    // MARK: - Configuration

    func configuration() {
        guard let imageData = imageData else{return}
        image.image = UIImage(named: imageData)
    }
  

}
