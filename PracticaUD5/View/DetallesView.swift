//
//  DetallesView.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import SwiftUI

struct DetallesView: View {
    var pelicula: Peli
    var generoDiccionario: [Int: String]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Imagen del póster
                if let posterPath = pelicula.poster_path,
                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 420)
                    .clipped()
                } else {
                    Color.gray
                        .frame(height: 420)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    // Título con la estrella amarilla única
                    HStack {
                        Text(pelicula.title)
                            .font(.title)
                            .fontWeight(.medium)
                        Image(systemName: "star.fill")
                            .foregroundColor(.gold)
                    }
                    
                    // Muestra el año de estreno o la fecha completa si lo prefieres
                    Text(pelicula.release_date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Sinopsis")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    Text(pelicula.overview)
                        .font(.body)
                    
                    Text("Categorías")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    // Mostrar todas las categorías en círculos con fondo gris.
                    // Se obtiene la lista de nombres usando el método de extensión.
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(pelicula.todosLosGeneros(from: generoDiccionario), id: \.self) { genero in
                                Text(genero)
                                    .font(.caption)
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    // Preview con datos de ejemplo y diccionario de géneros de ejemplo.
    let peliculaEjemplo = Peli(
        id: 1,
        title: "Película de Ejemplo",
        vote_average: 7.8,
        poster_path: "/ejemplo.jpg",
        overview: "Esta es la descripción de la película de ejemplo. Se muestra para ver cómo se adapta el layout.",
        release_date: "2025-01-01",
        genre_ids: [28, 12]
    )
    
    // Diccionario de ejemplo: id de género a nombre.
    let generoDiccionarioEjemplo: [Int: String] = [
        28: "Acción",
        12: "Aventura"
    ]
    
    return DetallesView(pelicula: peliculaEjemplo, generoDiccionario: generoDiccionarioEjemplo)
}
