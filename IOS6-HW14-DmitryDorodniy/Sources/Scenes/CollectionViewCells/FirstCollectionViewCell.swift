//
//  FirstCollectionViewCell.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
static let identifier = "FirstCollectionViewCell"
    
//    @IBOutlet var imageView: UIImageView!

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4

        return imageView
    }()

   private lazy var titleLabel: UILabel = {
        let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 17)
       label.textAlignment = .right
        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        return label
    }()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = 4
//        // Initialization code
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
    }

    
    public func configure(with image: UIImage) {
        imageView.image = image
        titleLabel.text = "Photos"
        detailLabel.text = "123"
    }

    override func layoutSubviews() {
        super.layoutSubviews()

//    imageView.frame = contentView.bounds
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)

            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).inset(-4)
                make.leading.equalToSuperview()
            }

            detailLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).inset(-3)
                make.leading.equalToSuperview()
            }        
    }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        //        imageView.image = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    static func nib() -> UINib {
//return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
//    }

}
