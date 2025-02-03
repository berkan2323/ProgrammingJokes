//
//  JokeFavoritesView.swift
//  ProgrammingJokes
//
//  Created by Berkan Aydın on 3.02.2025.
//

import SwiftUI

struct JokeFavoritesView: View {
    @Binding var favorites: [Joke] // Use a binding to modify the favorites list

    var body: some View {
        List {
            ForEach(favorites) { joke in
                Text(joke.text)
                    .padding()
            }
            .onDelete(perform: deleteJoke) // Add onDelete modifier
        }
        .navigationTitle("Favorites")
    }

    private func deleteJoke(at offsets: IndexSet) {
        favorites.remove(atOffsets: offsets) // Remove jokes at specified offsets
    }
}
