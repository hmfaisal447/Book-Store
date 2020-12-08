//
//  StoreForYouViewController.swift
//  book store
//
//  Created by codegradients on 08/12/2020.
//

import UIKit

class StoreForYouViewController: UIViewController {
    
    @IBOutlet weak var forYouCollectionView: UICollectionView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var segmentalControl: UISegmentedControl!
    
    let locationNames = ["Librairie", "Books Sanseido", "Cover 2 Cover Book Shop", "Just One More Chapter"]
    let locationImages = [UIImage(named: "high-angle-delicious-chocolate-cake-concept_23-2148769255"), UIImage(named: "decorating-delicious-homemade-eclairs-with-chocolate-peanuts_155003-1868"), UIImage(named: "good-humoured-caucasian-woman-eating-creamy-pie-stunning-girl-enjoying-fruits-birthday-cake_197531-9720"), UIImage(named: "purple-glitter-blueberry-cake-with-chocolate-glaze-white-surface-copy-space_107760-509")]
    let locations = ["Bucharest", "San Cristobal De Las Casas", "Innsbruck", "San Cristobal De Las Casas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forYouCollectionView.dataSource = self
        forYouCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
extension StoreForYouViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.forYouCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forYouCell", for: indexPath) as! myCollectionViewCell
        cell.forYouImageView.image = locationImages[indexPath.row]
        cell.forYouImageView.layer.cornerRadius = 10
        return cell
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCell", for: indexPath) as! myCollectionViewCell
        cell.featuredImageView.image = locationImages[indexPath.row]
        cell.featuredImageView.layer.cornerRadius = 10
            return cell
        }
    }
    
}
