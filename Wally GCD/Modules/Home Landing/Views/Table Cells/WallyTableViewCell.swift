//
//  WallyTableViewCell.swift
//  Wally GCD
//
//  Created by Shreyansh Raj  Keshri on 01/11/23.
//

import UIKit

class WallyTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var photos: [Photo]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: Constants.HomeLanding.WallyCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.HomeLanding.WallyCollectionViewCell)
    }
    
    func configureUI(photos: [Photo]?) {
        guard let photos = photos else { return }
        self.photos = photos
    }
}


extension WallyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WallyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.HomeLanding.WallyCollectionViewCell, for: indexPath) as! WallyCollectionViewCell
        cell.configureUI(photo: photos?[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}

