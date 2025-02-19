//
//  GeneroModel.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import Foundation

struct Genero: Codable {
    let id: Int
    let name: String
}
 struct GeneroResponse: Codable {
    let genres: [Genero]
}
