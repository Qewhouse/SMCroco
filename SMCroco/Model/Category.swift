//
//  Category.swift
//  SMCroco
//
//  Created by Лариса Терегулова on 19.04.2023.
//

import UIKit

struct Category {
    
    let color:[UIColor] = [UIColor(named: "1")!,
                           UIColor(named: "2")!,
                           UIColor(named: "3")!,
                           UIColor(named: "4")!]
    
    let image: [UIImage] = [#imageLiteral(resourceName: "Лягушата"), #imageLiteral(resourceName: "Стройняшки"), #imageLiteral(resourceName: "Ковбои"), #imageLiteral(resourceName: "Красотки")]
    
    let name: [String] = ["Животные", "Еда", "Личности", "Хобби"]
    
    let mark = UIImage(systemName: "checkmark.circle.fill")
}
