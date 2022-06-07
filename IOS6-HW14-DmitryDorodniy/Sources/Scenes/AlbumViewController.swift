//
//  AlbumViewController.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - Set elements

    private lazy var albumCollectionView: UICollectionView = {
        let album = UICollectionView()


        return album
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

    }

    // MARK: - Setup View
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
    }

}
