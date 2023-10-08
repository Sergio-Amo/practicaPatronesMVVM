//
//  Hero.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 8/10/23.
//

import Foundation

struct Hero: Decodable, Equatable {
    let id: String,
        name: String,
        description: String,
        photo: URL,
        favorite: Bool
}
