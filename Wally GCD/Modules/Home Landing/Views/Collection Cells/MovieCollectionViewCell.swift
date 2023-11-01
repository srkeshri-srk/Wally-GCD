//
//  MovieCollectionViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImageView: UIImageView!
    
    var images = ["panda1", "panda2", "panda3", "panda4", "panda5", "panda6"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

}

private extension MovieCollectionViewCell {
    func setupUI() {
        artworkImageView.image = UIImage(named: images.randomElement() ?? "panda1")
    }
}