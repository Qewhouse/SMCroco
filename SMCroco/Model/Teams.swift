//
//  Teams.swift
//  SMCroco
//
//  Created by Лариса Терегулова on 18.04.2023.
//

import UIKit

struct Teams {
    let teams: [String] = ["Ковбои", "Стройняшки", "Красотки", "Лягушата"]
    lazy var randomElement = teams.randomElement()
    lazy var randomElement2 = teams.randomElement()
    lazy var randomTeams: [String] = [randomElement!, randomElement2!]
}
