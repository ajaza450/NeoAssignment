//
//  TableViewCell.swift
//  NeoTestSwitUIkit
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak  var content_View: UIView!
    @IBOutlet weak var title_lbl:UILabel!
    @IBOutlet weak var sub_title_lbl:UILabel!
    @IBOutlet weak var image_view:UIImageView!

    var itemInfo: ItemInfo? {
        didSet {
            configuration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // add Corner
        content_View.layer.cornerRadius = 5
        content_View.layer.masksToBounds = true
        image_view.layer.cornerRadius = 5
        image_view.layer.masksToBounds = true
    }
    
    
    
    // MARK: - Configuration
    
    func configuration() {
        guard let itemInfo = itemInfo else{return}
        title_lbl.text = itemInfo.title
        sub_title_lbl.text = itemInfo.subtitle
        image_view.image = UIImage(named: itemInfo.imageName)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - TableView ContentSize

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
