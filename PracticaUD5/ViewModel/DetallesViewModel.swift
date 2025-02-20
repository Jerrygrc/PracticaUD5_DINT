//
//  DetallesViewModel.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import Foundation

class DetallesViewModel: ObservableObject {
    let pelicula: Peli
    let generoDiccionario: [Int: String]
    
    init(pelicula: Peli, generoDiccionario: [Int: String]) {
        self.pelicula = pelicula
        self.generoDiccionario = generoDiccionario
    }
    
    var posterUrl: URL? {
        if let posterPath = pelicula.poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
        return nil
    }
    
    var generos: [String] {
        pelicula.todosLosGeneros(from: generoDiccionario)
    }
}
