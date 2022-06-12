//
//  AlbumViewController.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

    // MARK: - Set elements

    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds,
                                style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.register(TextTableViewCell.self,
                       forCellReuseIdentifier: TextTableViewCell.reuseIdentifier)
        table.register(MyAlbumCollectionTableViewCell.self,
                       forCellReuseIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier)
        table.register(CommonAlbumCollectionTableViewCell.self,
                       forCellReuseIdentifier: CommonAlbumCollectionTableViewCell.reuseIdentifier)

        table.backgroundColor = .clear
        table.sectionHeaderHeight = 40
        table.rowHeight = UITableView.automaticDimension
        table.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        return table
    }()

    // MARK: - Lifecycle

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
    }

    @objc private func addTapped() {
        print("Button tapped")
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

    // MARK: - Setup table headers

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 17, y: 8, width: view.frame.width, height: 33))
        headerView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        let detailButton = UIButton()
        var config = UIButton.Configuration.plain()
        config.titleAlignment = .leading
        detailButton.configuration = config
        detailButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        headerView.addSubview(detailButton)

        detailButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }

        switch section {
        case 0:
            titleLabel.text = "Мои альбомы"
            detailButton.setTitle("Все", for: .normal)
        case 1:
            titleLabel.text = "Общие альбомы"
            detailButton.setTitle("Все", for: .normal)
        case 2:
            titleLabel.text = "Типы медиафайлов"
        case 3:
            titleLabel.text = "Другое"
        default:
            titleLabel.text = "Херня!"
        }
        return headerView
    }

    // MARK: - Setup table rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! MyAlbumCollectionTableViewCell
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommonAlbumCollectionTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! CommonAlbumCollectionTableViewCell
            return cell

        case 2, 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! TextTableViewCell
            cell.accessoryType = .disclosureIndicator
            cell.configure(with: cellTableData[indexPath.section][indexPath.row])
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumCollectionTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! MyAlbumCollectionTableViewCell
            return cell
        }
    }
}

// MARK: - Table Delegate

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let title = cellTableData[indexPath.section][indexPath.row].title
        print("Выбрана ячейка \(title)")
    }
}
