//
//  GeneroModel.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import Foundation
//Tenemos que crear un modelo para el género porque necesitamos hacer otra llamada a la API deferente a la de las películas
struct Genero: Codable {
    let id: Int
    let name: String
}
 struct GeneroResponse: Codable {
    let genres: [Genero]
}
