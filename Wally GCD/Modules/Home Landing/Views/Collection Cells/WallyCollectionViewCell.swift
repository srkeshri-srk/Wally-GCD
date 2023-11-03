//
//  WallyCollectionViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class WallyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var images = ["panda1", "panda2", "panda3", "panda4", "panda5", "panda6"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func reset() {
        artworkImageView.image = nil
        nameLabel.text = nil
    }
    
    private func setupUI() {
        artworkImageView.layer.cornerRadius = 8.0
        nameLabel.backgroundColor = .black.withAlphaComponent(0.6)
    }
    
    func configureUI() {
        artworkImageView.image = UIImage(named: images.randomElement() ?? "panda1")
        nameLabel.text = images.randomElement() ?? "Random"
    }

}
