//
//  ViewController.swift
//  book store
//
//  Created by codegradients on 07/12/2020.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storeCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var storeData = StoreDefaultData()
    var storeAPIManager = StoreAPIManager()
    let storeUrl = "https://mybookstores.net/api/course/list/24"

    override func viewDidLoad() {
        super.viewDidLoad()
        storeAPIManager.delegate = self
        storeAPIManager.performRequest(with: storeUrl)
        storeCollectionView.dataSource = self
        storeCollectionView.delegate = self
    }
    @IBAction func searchBtn(_ sender: UIButton) {
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
extension StoreViewController: StoreAPIManagerDelegate {
    func didUpdate(storeReturnData: StoreReturnData) {
        DispatchQueue.main.async {
            self.titleLabel.text = storeReturnData.name
        }

    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
