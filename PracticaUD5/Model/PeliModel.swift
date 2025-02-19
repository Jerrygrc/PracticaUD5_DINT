//
//  PeliModel.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import Foundation

struct Peli: Identifiable, Decodable{
    var id: Int
    var title: String
    var vote_average: Double
    var poster_path: String?
    var overview: String
    var release_date: String
    var genre_ids: [Int]
}
extension Peli {
    func primerGenero(from dictionary: [Int: String]) -> String {
        if let primerId = genre_ids.first, let nombreGenero = dictionary[primerId] {
            return nombreGenero
        }
        return "Sin género"
    }
    func todosLosGeneros(from dictionary: [Int: String]) -> [String] {
        return genre_ids.compactMap { dictionary[$0] }
    }
}

