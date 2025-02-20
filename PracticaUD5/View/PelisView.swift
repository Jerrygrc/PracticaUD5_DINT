//
//  PelisView.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import SwiftUI

struct PelisView: View {
    
    @StateObject var viewModel = PeliViewModel()
    let gridItem: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @State var searchText: String = ""
    
    var peliculasFiltradas: [Peli] {
        if searchText.isEmpty {
            return viewModel.datosPeli
        } else {
            return viewModel.datosPeli.filter { pelicula in
                pelicula.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            // Título
            HStack {
                Image(systemName: "movieclapper.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                Text("Movies")
                    .font(.title)
                    .fontWeight(.bold)
                Image(systemName: "movieclapper.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            // TextField de búsqueda
            TextField("Buscar película", text: $searchText)
                .padding(10)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            // Título del Scroll
            Text("Películas mejor valoradas")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            // Scroll con el grid de películas
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 30) {
                    ForEach(peliculasFiltradas) { pelicula in
                        NavigationLink(destination: DetallesView(viewModel: DetallesViewModel(pelicula: pelicula, generoDiccionario: viewModel.generoDiccionario))) {
                            PeliculaCell(pelicula: pelicula, generoDiccionario: viewModel.generoDiccionario)
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("fondo")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.10)
        )
        .padding(.horizontal)
    }
}

#Preview {
    PelisView()
}
