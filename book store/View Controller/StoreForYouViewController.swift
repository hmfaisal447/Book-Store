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
    
    var storeData = StoreData()

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
        let data = storeData
        if collectionView == self.forYouCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forYouCell", for: indexPath) as! myCollectionViewCell
            cell.forYouImageView.image = data.locationImages[indexPath.row]
            cell.forYouImageView.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCell", for: indexPath) as! myCollectionViewCell
            cell.featuredImageView.image = data.locationImages[indexPath.row]
            cell.featuredImageView.layer.cornerRadius = 10
            return cell
        }
    }
    
}
