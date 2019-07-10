//
//  Structs.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/9/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import Foundation

struct Amibo: Codable {
    let amiibo: [Amiibo]
}

struct Amiibo: Codable {
    let amiiboSeries, character, gameSeries, head: String
    let image: String
    let name: String
    let release: Release
    let tail, type: String
}

struct Release: Codable {
    let au, eu, jp, na: String
}
