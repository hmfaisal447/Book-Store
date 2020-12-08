//
//  ViewController.swift
//  book store
//
//  Created by codegradients on 07/12/2020.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    let locationNames = ["Librairie", "Books Sanseido", "Cover 2 Cover Book Shop", "Just One More Chapter"]
    let locationImages = [UIImage(named: "high-angle-delicious-chocolate-cake-concept_23-2148769255"), UIImage(named: "decorating-delicious-homemade-eclairs-with-chocolate-peanuts_155003-1868"), UIImage(named: "good-humoured-caucasian-woman-eating-creamy-pie-stunning-girl-enjoying-fruits-birthday-cake_197531-9720"), UIImage(named: "purple-glitter-blueberry-cake-with-chocolate-glaze-white-surface-copy-space_107760-509")]
    let locations = ["Bucharest", "San Cristobal De Las Casas", "Innsbruck", "San Cristobal De Las Casas"]
    
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
        self.performSegue(withIdentifier: "gotoForYou", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCollectionViewCell
        cell.locationName.text = locationNames[indexPath.row]
        print(locationNames[indexPath.row])
        cell.location.text = locations[indexPath.row]
        cell.storeImageView.image = locationImages[indexPath.row]
        cell.storeImageView.layer.cornerRadius = 10
        return cell
    }
}
