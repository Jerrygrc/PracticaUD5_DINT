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
    
    var peliculasFiltradas: [Peli]{
        if searchText.isEmpty{
            return viewModel.datosPeli
        }else{
            return viewModel.datosPeli.filter { pelicula in
                pelicula.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View {
        VStack {
            //Título
            HStack{
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
            //TextField para la búsqueda de películas
            TextField("Buscar película", text: $searchText)
                .padding(10)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            //Titulo del Scroll
            Text("Películas mejor valoradas")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            //ScrollView con las películas recuperadas de la API
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 30) {
                    ForEach(peliculasFiltradas) { pelicula in
                        NavigationLink(destination: DetallesView(pelicula: pelicula)){
                            VStack(alignment: .leading){
                                ZStack(alignment: .topTrailing) {
                                    if let posterPath = pelicula.poster_path {
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                                            image.resizable()
                                                .scaledToFit()
                                        } placeholder: {
                                            Color.gray.opacity(0.3)
                                        }
                                        .frame(width: 160, height: 240)
                                        .cornerRadius(10)
                                    }
                                    Text(String(format: "%.1f", pelicula.vote_average))
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .foregroundColor(.redCarpet)
                                        .clipShape(Circle())
                                        .offset(x: 20, y: -20)
                                }
                                Text(pelicula.title)
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(pelicula.primerGenero(from: viewModel.generoDiccionario))
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
                }.padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("fondo")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .opacity(0.10))
        .padding(.horizontal)
    }
}
#Preview {
    PelisView()
}
