//
//  TableCellData.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 08.06.2022.
//

import Foundation
import UIKit

struct TableCell {
    var image: String
    var title: String
    var detail: Int
}

class TableCellApi {
    static func getTableCellData() -> [[TableCell]] {

        let tableSectionMediafiles = [TableCell(image: "video", title: "Видео", detail: 375),
                                      TableCell(image: "person.crop.square", title: "Селфи", detail: 400),
                                      TableCell(image: "livephoto", title: "Фото Live Photos", detail: 223),
                                      TableCell(image: "cube", title: "Портреты", detail: 100),
                                      TableCell(image: "timelapse", title: "Таймлапс", detail: 24),
                                      TableCell(image: "square.stack.3d.down.right", title: "Серии", detail: 12),
                                      TableCell(image: "camera.viewfinder", title: "Снимки экрана", detail: 35),
                                      TableCell(image: "square.stack.3d.forward.dottedline", title: "Анимированные", detail: 121)]

        let tableSectionOther = [TableCell(image: "square.and.arrow.down", title: "Импортированные", detail: 232),
                                 TableCell(image: "eye.slash", title: "Скрытые", detail: 0),
                                 TableCell(image: "trash", title: "Недавно удалённые", detail: 73),]

        return [tableSectionMediafiles, tableSectionOther]
    }

}
