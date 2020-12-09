//
//  WinterViewController.swift
//  book store
//
//  Created by codegradients on 09/12/2020.
//

import UIKit

class WinterViewController: UIViewController {

    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var desBtn: UIButton!
    @IBOutlet weak var revBtn: UIButton!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var commandBtn: UIButton!
    @IBOutlet weak var imageView: imageView!
    @IBOutlet weak var basketBtn: UIButton!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var winterNameLabel: UILabel!
    @IBOutlet weak var winterPriceLabel: UILabel!
    
    var storeData = StoreData()
    var indexValueIs = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backbtn.layer.cornerRadius = 10
        backbtn.clipsToBounds = true
        desBtn.layer.cornerRadius = 10
        desBtn.clipsToBounds = true
        revBtn.layer.cornerRadius = 10
        revBtn.clipsToBounds = true
        starBtn.layer.cornerRadius = 10
        starBtn.clipsToBounds = true
        bookBtn.layer.borderWidth = 1
        bookBtn.layer.cornerRadius = 10
        bookBtn.clipsToBounds = true
        bookBtn.layer.borderColor = UIColor.systemGray.cgColor
        commandBtn.layer.borderWidth = 1
        commandBtn.layer.cornerRadius = 10
        commandBtn.clipsToBounds = true
        commandBtn.layer.borderColor = UIColor.systemGray.cgColor
        basketBtn.layer.cornerRadius = 10
        basketBtn.clipsToBounds = true
        buyNowBtn.layer.cornerRadius = 10
        buyNowBtn.clipsToBounds = true
        mainView.layer.cornerRadius = 40
        mainView.clipsToBounds = true
        insideView.layer.cornerRadius = 10
        insideView.clipsToBounds = true
        winterNameLabel.text = storeData.forYouName[indexValueIs]
        winterPriceLabel.text = storeData.forYouPrice[indexValueIs]
        imageView.image = storeData.locationImages[indexValueIs]
    }
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
class imageView: UIImageView {
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.roundUpCorners([.bottomLeft, .bottomRight], radius: 30)
    }
}
extension UIView {
func roundUpCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
}
}
