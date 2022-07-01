//
//  My Album Data Source.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 30.06.22.
//

import UIKit

struct MyAlbumDataSource {
    static func get() -> [Album] {
        return [
            Album(image: UIImage(named: "recent")!, name: "Недавние", imageCount: "612"),
            Album(image: UIImage(named: "favorites")!, name: "Избранное", imageCount: "3"),
            Album(image: UIImage(named: "18.35")!, name: "Тм 18/35", imageCount: "16"),
            Album(image: UIImage(named: ".35")!, name: "Тм ./35 крепежи", imageCount: "4"),
            Album(image: UIImage(named: "army")!, name: "Армия", imageCount: "18"),
            Album(image: UIImage(named: "whatsapp")!, name: "Whatsapp", imageCount: "31"),
            Album(image: UIImage(named: "snapseed")!, name: "Snapseed", imageCount: "4"),
            Album(image: UIImage(named: "act")!, name: "Акт по крепежам", imageCount: "25")
        ]
    }
}
