//
//  AlbumViewController.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

   private let cellData = CellApi.getCellData()
    let cellsCountInRow: CGFloat = 2
    let collectionInsets: CGFloat = 18 //расстояние между ячейками
    let collectionCellMarginFromPictureToCellBottom: CGFloat = 80

    let imageSection1 = ["dog - 1",
                         "dog - 2",
                         "dog - 3",
                         "dog - 4"]

    // MARK: - Set elements

    private lazy var albumCollectionView: UICollectionView = {
        let album = UICollectionView(frame: view.frame,
                                     collectionViewLayout: UICollectionViewFlowLayout())

        album.register(FirstCollectionViewCell.self,
                       forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }

    private func setupHierarchy() {
//        view.addSubview(tableView)
       view.addSubview(albumCollectionView)
    }


    private func setupLayout() {
//        albumCollectionView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
    }

    @objc private func addTapped() {
        print("Tap + in navigation")
    }

}

// MARK: - Collection datasource
extension AlbumViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return imageSection1.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        cell.configure(with: UIImage(named: imageSection1[indexPath.row])!)
        return cell
    }
}

// MARK: - Table datasoure
extension AlbumViewController: UITableViewDataSource {

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count //число секций
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData[section].count //задаём число элементов в каждой секции
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! TextTableViewCell

        cell.accessoryType = .disclosureIndicator
        cell.configure(with: cellData[indexPath.section][indexPath.row])
        
        return cell
    }
}
// MARK: - Table, Collection Delegate
extension AlbumViewController: UITableViewDelegate, UICollectionViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let title = cellData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and row \(indexPath.row)")
    }
}

// MARK: - FlowLayout Delegate
extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

    
        let cellWidth = view.frame.width / cellsCountInRow
        let cellHeight = cellWidth + collectionCellMarginFromPictureToCellBottom
        let spacing = (cellsCountInRow + 1) * collectionInsets / cellsCountInRow
        return CGSize(width: cellWidth - spacing,
                     height: cellHeight - collectionInsets * 2)

    }

//    зазор между линиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    //отступы по периметру коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: collectionInsets, left: collectionInsets + 2, bottom: collectionInsets, right: collectionInsets + 2)
    }
}
