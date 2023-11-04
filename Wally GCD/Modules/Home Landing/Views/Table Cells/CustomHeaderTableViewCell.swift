//
//  CustomHeaderTableViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet private weak var sectionTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(title: String) {
        sectionTitleLabel.text = title
    }
}
