//
//  TextTableViewCell.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 08.06.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    static let reuseIdentifier = "TextTableViewCell"


    func configure(with model: TableCell) {
        var content = self.defaultContentConfiguration()
        let image = UIImage(systemName: model.image)

//        content.imageProperties.tintColor =
        content.imageProperties.maximumSize = CGSize(width: 20, height: 20)
        content.image = image
        content.textProperties.color = .systemBlue
        content.text = model.title
        content.secondaryText = String(model.detail)

        self.contentConfiguration = content
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
