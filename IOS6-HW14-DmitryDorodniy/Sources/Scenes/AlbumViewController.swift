//
//  AlbumViewController.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

//    let cellData = CellApi.getCellData()
    let cellsCountInRow: CGFloat = 2
    let collectionInsets: CGFloat = 18 //расстояние между ячейками
    let collectionCellMarginFromPictureToCellBottom: CGFloat = 58

    // MARK: - Set elements
//
//    private lazy var albumCollectionView: UICollectionView = {
//let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let album = UICollectionView(frame: view.frame,
//                                     collectionViewLayout: layout)
//        album.showsHorizontalScrollIndicator = false
//        album.showsVerticalScrollIndicator = false
//        album.register(CollectionViewCell.self,
//                       forCellWithReuseIdentifier: CollectionViewCell.identifier)
//        album.dataSource = self
//        album.delegate = self
//        return album
//    }()

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds,
                                style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.reuseIdentifier)
        table.register(MyAlbumCollectionTableViewCell.self, forCellReuseIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier)
        table.register(CommonAlbumCollectionTableViewCell.self, forCellReuseIdentifier: CommonAlbumCollectionTableViewCell.reuseIdentifier)
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = .clear
        table.sectionHeaderHeight = 40
        table.rowHeight = UITableView.automaticDimension
        table.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        table.estimatedRowHeight = 30

        return table
    }()

   private lazy var tableSectionHeader: UIView = {
        let header = UIView()
        return header
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        label.text = "Заголовок"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .right
        return label
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
     view.addSubview(tableView)
//   view.addSubview(albumCollectionView)
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
        return cellFirstCollectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell

        cell.configure(with: cellFirstCollectionData[indexPath.row])
        return cell
    }
}

// MARK: - Table datasoure
extension AlbumViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return cellTableData.count //число секций
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTableData[section].count //задаём число элементов в каждой секции
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return Metric.tableCellForPicturesHight
//    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 17, y: 15, width: view.frame.width, height: 20))
        headerView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        switch section {
        case 0:
            titleLabel.text = "Мои альбомы"
        case 1:
            titleLabel.text = "Общие альбомы"
        case 2:
            titleLabel.text = "Типы медиафайлов"
        case 3:
            titleLabel.text = "Другое"
        default:
            titleLabel.text = "Херня!"
        }
        return headerView
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       switch indexPath.section {
       case 0:
           let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier, for: indexPath) as! MyAlbumCollectionTableViewCell
           
//           cell.configure(with: cellFirstCollectionData[indexPath.row])
                   return cell

       case 1:
           let cell = tableView.dequeueReusableCell(withIdentifier: CommonAlbumCollectionTableViewCell.reuseIdentifier, for: indexPath) as! CommonAlbumCollectionTableViewCell
print(indexPath)
//           cell.configure(with: cellSecondColletionData[indexPath.row])
           return cell


   case 2, 3:
       let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier,
                                                for: indexPath) as! TextTableViewCell

       cell.accessoryType = .disclosureIndicator
       cell.configure(with: cellTableData[indexPath.section][indexPath.row])

       return cell
       default:
           let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier, for: indexPath) as! MyAlbumCollectionTableViewCell
           return cell
       }

//        let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier, for: indexPath) as! MyAlbumCollectionTableViewCell
//
//
//        return cell
//   }

//        let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier,
//                                                 for: indexPath) as! TextTableViewCell
//
//        cell.accessoryType = .disclosureIndicator
//        cell.configure(with: cellTableData[indexPath.section][indexPath.row])
//
//        return cell
    }
}
// MARK: - Table, Collection Delegate
extension AlbumViewController: UITableViewDelegate, UICollectionViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let title = cellTableData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and row \(indexPath.row)")
    }
}

//// MARK: - FlowLayout Delegate
//extension AlbumViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        let cellWidth = view.frame.width / cellsCountInRow
//      let cellHeight = cellWidth + collectionCellMarginFromPictureToCellBottom
//        let spacing = (cellsCountInRow + 1) * collectionInsets / cellsCountInRow
//        return CGSize(width: cellWidth - spacing,
//                     height: cellHeight - collectionInsets * 2)
//    }
//
////    зазор между линиями
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    //отступы по периметру коллекции
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: collectionInsets, left: collectionInsets + 2, bottom: collectionInsets, right: collectionInsets + 2)
//    }
//}
