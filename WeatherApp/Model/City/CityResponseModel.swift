//
//  CityResponseModel.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation

// MARK: - CityElement
struct CityResponseModel: Codable {
    let coord: Coord?
    let country: String?
    let id: Int?
    let name, state: String?
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double?
}

typealias Cities = [CityResponseModel]
