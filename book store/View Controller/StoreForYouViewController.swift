//
//  StoreForYouViewController.swift
//  book store
//
//  Created by codegradients on 08/12/2020.
//

import UIKit
import TTSegmentedControl

class StoreForYouViewController: UIViewController {
    
    @IBOutlet weak var forYouCollectionView: UICollectionView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var segmentalControl: UISegmentedControl!
    @IBOutlet weak var backbtn: UIButton!
    
    var storeData = StoreData()
    var indexValue = 0
    var segmentedValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        forYouCollectionView.dataSource = self
        forYouCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        backbtn.layer.borderWidth = 1
        backbtn.layer.cornerRadius = 10
        backbtn.clipsToBounds = true
        backbtn.layer.borderColor = UIColor.systemGray.cgColor

    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        segmentedValue = sender.selectedSegmentIndex
        print(segmentedValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? WinterViewController {
                        nextViewController.indexValueIs = indexValue
        }
    }
}
extension StoreForYouViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexValue = indexPath.item
        self.performSegue(withIdentifier: K.segueWinter, sender: self)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = storeData
        if collectionView == self.forYouCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.identifierforYouCell, for: indexPath) as! myCollectionViewCell
            cell.forYouImageView.image = data.locationImages[indexPath.row]
            cell.forYouLocationName.text = data.forYouName[indexPath.row]
            cell.forYouPriceLabel.text = data.forYouPrice[indexPath.row]
            cell.forYouImageView.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.identifierfeaturedCell, for: indexPath) as! myCollectionViewCell
                cell.featuredImageView.image = data.locationImages[indexPath.row]
                cell.featuredFlowers.text = data.forYouName[indexPath.row]
                cell.featuredPrice.text = data.forYouPrice[indexPath.row]
//             if segmentedValue == 1 {
//                cell.featuredImageView.image = data.locationImages[indexPath.row]
//                cell.featuredFlowers.text = data.forYouName[indexPath.row]
//                cell.featuredPrice.text = data.segmentedOne[indexPath.row]
//            }else if segmentedValue == 2 {
//                cell.featuredImageView.image = data.locationImages[indexPath.row]
//                cell.featuredFlowers.text = data.forYouName[indexPath.row]
//                cell.featuredPrice.text = data.segmentedTwo[indexPath.row]
//            }
            cell.featuredImageView.layer.cornerRadius = 10
            return cell
        }
    }
    
}
