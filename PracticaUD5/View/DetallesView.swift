//
//  DetallesView.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import SwiftUI

struct DetallesView: View {
    @StateObject var viewModel: DetallesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let url = viewModel.posterUrl {
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
                    HStack {
                        Text(viewModel.pelicula.title)
                            .font(.title)
                            .fontWeight(.medium)
                        Image(systemName: "star.fill")
                            .foregroundColor(.gold1)
                    }
                    
                    Text(viewModel.pelicula.release_date)
                        .font(.subheadline)
                        .foregroundColor(.redCarpet)
                    
                    Text("Sinopsis")
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                    Text(viewModel.pelicula.overview)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
                    Text("Categorías")
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.generos, id: \.self) { genero in
                                Text(genero)
                                    .font(.caption)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                    .frame(maxWidth: .infinity, alignment: .leading)
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

