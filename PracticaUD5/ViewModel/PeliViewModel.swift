//
//  PeliViewModel.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import Foundation

class PeliViewModel: ObservableObject {
    @Published var datosPeli: [Peli] = []
    @Published var generoDiccionario: [Int: String] = [:]
    
    private let apiKey = "c52fb7d43ad70fb123cff6e35e97bff5"
    
    init(){
        fetchGeneros()
        fetchPelis()
    }
    //llamada para convertir los ids de genre_ids en el nombre del género (sin URL components)
    func fetchGeneros(){
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=es-ES") else { return }

                URLSession.shared.dataTask(with: url) { (data, _, error) in
                    guard let data = data, error == nil else { return }
                    
                    do {
                        let decodedResponse = try JSONDecoder().decode(GeneroResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.generoDiccionario = Dictionary(uniqueKeysWithValues: decodedResponse.genres.map { ($0.id, $0.name) })
                            print("Géneros cargados: \(self.generoDiccionario)")
                        }
                    } catch {
                        print("Error al decodificar los géneros: \(error.localizedDescription)")
                    }
                }.resume()
        
    }
    // forma recomendada con URLComponents para evitar fallos en caracteres especiales
    func fetchPelis() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/top_rated"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "es-ES"),
            URLQueryItem(name: "page", value: "1")
        ]
        // Antes de mandar petición comprobar que es correcta
        guard let url = components.url else {
            print("Error: No se pudo construir la URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    self.datosPeli = decodedResponse.results
                }
            } catch let error as NSError{
                print("Error al decodificar JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
