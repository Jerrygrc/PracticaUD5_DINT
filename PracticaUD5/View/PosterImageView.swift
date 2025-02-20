//
//  PosterImageView.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//
import SwiftUI
// Extraemos esta parte del código para ayudar al compilador a inferir expresiones complejas y solucionar el error:
// The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
struct PosterImageView: View {
    let posterPath: String
    
    var body: some View {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 160, height: 240)
            .cornerRadius(10)
        } else {
            Color.gray.opacity(0.3)
                .frame(width: 160, height: 240)
        }
    }
}

