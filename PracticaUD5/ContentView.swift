//
//  ContentView.swift
//  PracticaUD5
//
//  Created by Gerardo Ramallo Couce on 19/2/25.
//

import SwiftUI
//metemos el NavigationStack en nivel superior para que en cada view podamos utilizar el NavigationLink directamente
struct ContentView: View {
    var body: some View {
        NavigationStack{
            PelisView()
        }
    }
}

#Preview {
    ContentView()
}
