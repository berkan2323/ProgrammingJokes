//
//  ContentView.swift
//  ProgrammingJokes
//
//  Created by Berkan Aydın on 3.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JokeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let joke = viewModel.joke {
                    Text(joke.text)
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                } else {
                    Text("Tap the button to fetch a joke!")
                        .font(.headline)
                        .padding()
                }

                HStack {
                    Button("New Joke") {
                        viewModel.fetchRandomJoke()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()

                    Button("Add to Favorites") {
                        viewModel.addToFavorites()
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .disabled(viewModel.joke == nil)
                }

                Spacer()

                NavigationLink(destination: JokeFavoritesView(favorites: $viewModel.favorites)) {
                    Text("View Favorites")
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle("Programming Jokes")
            .onAppear {
                viewModel.fetchRandomJoke()
            }
        }
    }
}


#Preview {
    ContentView()
}
