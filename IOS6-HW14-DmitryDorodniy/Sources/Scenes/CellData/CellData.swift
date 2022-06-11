//
//  TableCellData.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 08.06.2022.
//

import Foundation
import UIKit

struct Cell {
    var image: String
    var title: String
    var detail: Int
}

class CellApi {
    static func getCellData() -> [[Cell]] {

        let firstTableSection = [Cell(image: "video", title: "Видео", detail: 375)]
        let secondTableSection = [Cell(image: "video", title: "Видео", detail: 375)]
        let tableSectionMediafiles = [Cell(image: "video", title: "Видео", detail: 375),
                                      Cell(image: "person.crop.square", title: "Селфи", detail: 400),
                                      Cell(image: "livephoto", title: "Фото Live Photos", detail: 223),
                                      Cell(image: "cube", title: "Портреты", detail: 100),
                                      Cell(image: "timelapse", title: "Таймлапс", detail: 24),
                                      Cell(image: "square.stack.3d.down.right", title: "Серии", detail: 12),
                                      Cell(image: "camera.viewfinder", title: "Снимки экрана", detail: 35),
                                      Cell(image: "square.stack.3d.forward.dottedline", title: "Анимированные", detail: 121)]

        let tableSectionOther = [Cell(image: "square.and.arrow.down", title: "Импортированные", detail: 232),
                                 Cell(image: "eye.slash", title: "Скрытые", detail: 0),
                                 Cell(image: "trash", title: "Недавно удалённые", detail: 73),]

        return [firstTableSection, secondTableSection, tableSectionMediafiles, tableSectionOther]
    }

    static func getCollectionFirstCellData() -> [Cell] {
        let imageSectionMyAlbum = [Cell(image: "dog - 1", title: "Recent", detail: 3075),
                                   Cell(image: "dog - 2", title: "Wallpaper", detail: 400),
                                   Cell(image: "dog - 3", title: "Фото Live Photos", detail: 223),
                                   Cell(image: "dog - 4", title: "Портреты", detail: 100),
                                   Cell(image: "dog - 5", title: "Таймлапс", detail: 24),
                                   Cell(image: "dog - 6", title: "Серии", detail: 12),
                                   Cell(image: "dog - 7", title: "Снимки экрана", detail: 35),
                                   Cell(image: "dog - 8", title: "Анимированные", detail: 121)]

return imageSectionMyAlbum
    }

    static func getCollectionSecondCellData() -> [Cell] {
        let imageSectionCommonAlbum = [Cell(image: "dog - 9", title: "Doggy", detail: 2001),
                                       Cell(image: "dog - 10", title: "Our life", detail: 400),
                                       Cell(image: "dog - 11", title: "Путешествие", detail: 223),
                                       Cell(image: "dog - 12", title: "Скриншоты", detail: 100)]

        return imageSectionCommonAlbum
    }

}


let cellTableData = CellApi.getCellData()
let cellFirstCollectionData = CellApi.getCollectionFirstCellData()
let cellSecondColletionData = CellApi.getCollectionSecondCellData()

enum Metric {
    static let tableCellForPicturesHight: CGFloat = 475
}



