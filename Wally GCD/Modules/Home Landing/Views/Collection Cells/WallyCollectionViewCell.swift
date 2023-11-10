//
//  WallyCollectionViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit
import Kingfisher


class WallyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
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
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
        nameLabel.backgroundColor = .black.withAlphaComponent(0.6)
    }
    
    func configureUI(photo: Photo?) {
        guard let photo = photo else { return }
        reset()
        
        nameLabel.text = photo.photographer
        if let artwork = photo.src?.small, let url = URL(string: artwork) {
            let processor = DownsamplingImageProcessor(size: artworkImageView.bounds.size)

            artworkImageView.kf.indicatorType = .activity
            artworkImageView.kf.setImage(with: url, placeholder: UIImage(named: "launchScreen"), options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage])
        }
    }

}
