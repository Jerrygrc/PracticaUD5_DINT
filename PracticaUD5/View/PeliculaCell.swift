//
//  PeliculaCell.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import SwiftUI
// Extraemos esta parte del código para ayudar al compilador a inferir expresiones complejas y solucionar el error:
// The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
struct PeliculaCell: View {
    let pelicula: Peli
    let generoDiccionario: [Int: String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                if let posterPath = pelicula.poster_path {
                    PosterImageView(posterPath: posterPath)
                }
                Text(String(format: "%.1f", pelicula.vote_average))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.redCarpet1)
                    .clipShape(Circle())
                    .offset(x: 20, y: -20)
            }
            Text(pelicula.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(pelicula.primerGenero(from: generoDiccionario))
                .font(.caption)
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
