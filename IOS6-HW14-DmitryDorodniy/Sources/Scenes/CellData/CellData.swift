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

        return [tableSectionMediafiles, tableSectionOther]
    }

}
