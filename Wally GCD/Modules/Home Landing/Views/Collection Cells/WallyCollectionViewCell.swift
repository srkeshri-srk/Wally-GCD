//
//  WallyCollectionViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit
import Kingfisher


class WallyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
        
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
    
    func configureUI(photo: Photo?) {
        guard let photo = photo else { return }
        reset()
        
        let url = URL(string: photo.src?.original ?? "")
        artworkImageView.kf.setImage(with: url)
        nameLabel.text = photo.photographer
    }

}
