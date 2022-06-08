//
//  FirstCollectionViewCell.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
static let identifier = "FirstCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with image: UIImage) {
        imageView.image = image
    }

    static func nib() -> UINib {
return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }

}
