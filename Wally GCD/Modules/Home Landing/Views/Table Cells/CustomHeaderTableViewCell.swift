//
//  CustomHeaderTableViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet private weak var sectionTitleLabel: UILabel!
    @IBOutlet private weak var sectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(title: String) {
        sectionTitleLabel.text = title
    }
    
    @IBAction func sectionButtonAction(_ sender: UIButton) {
        print("Tap Section Button!!")
    }
    
}
