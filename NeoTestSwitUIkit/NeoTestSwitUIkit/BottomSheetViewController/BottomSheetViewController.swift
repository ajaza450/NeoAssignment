//
//  BottomSheetViewController.swift
//  NeoTestSwitUIkit
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    @IBOutlet weak var statistics_lbl: UILabel!
    
    var statistics: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        statistics_lbl.text = statistics
    }


   

}
