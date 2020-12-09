//
//  ViewController.swift
//  book store
//
//  Created by codegradients on 07/12/2020.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    var storeData = StoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCollectionView.dataSource = self
        storeCollectionView.delegate = self
    }
}
extension StoreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: K.segueForYou, sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = storeData
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.identifierMyCell, for: indexPath) as! myCollectionViewCell
        cell.locationName.text = data.locationNames[indexPath.row]
        cell.location.text = data.locations[indexPath.row]
        cell.storeImageView.image = data.locationImages[indexPath.row]
        cell.storeImageView.layer.cornerRadius = 10
        return cell
    }
}
