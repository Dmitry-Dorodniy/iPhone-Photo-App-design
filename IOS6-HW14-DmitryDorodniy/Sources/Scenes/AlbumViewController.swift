//
//  AlbumViewController.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

   private let tableCellData = TableCellApi.getTableCellData()

    // MARK: - Set elements
    private lazy var albumCollectionView: UICollectionView = {
        let album = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        album.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        album.dataSource = self
       album.delegate = self
        return album
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds,
                                style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.reuseIdentifier)
        table.backgroundColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
    }

    // MARK: - Setup View
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"

    }

    private func setupHierarchy() {
//        view.addSubview(tableView)
        view.addSubview(albumCollectionView)
    }


    private func setupLayout() {
//        albumCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(tableView.snp_bottomMargin)
//            make.bottom.equalToSuperview()
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
//        albumCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        albumCollectionView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
}

}

extension AlbumViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        cell.configure(with: UIImage(named: "dog - 1")!)
        return cell
    }
}

extension AlbumViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellData.count //число секций
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellData[section].count //задаём число элементов в каждой секции
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier, for: indexPath) as! TextTableViewCell

        cell.accessoryType = .disclosureIndicator
        cell.configure(with: tableCellData[indexPath.section][indexPath.row])
        
        return cell
    }
}

extension AlbumViewController: UITableViewDelegate, UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = tableCellData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and row \(indexPath.row)")
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {

}
