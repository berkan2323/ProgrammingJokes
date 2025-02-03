//
//  JokeViewModel.swift
//  ProgrammingJokes
//
//  Created by Berkan Aydın on 3.02.2025.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke: Joke?
    @Published var favorites: [Joke] = []

    private let jokes = [
        "Why do programmers prefer dark mode? Because light attracts bugs!",
        "Why do Java developers wear glasses? Because they don’t C#!",
        "A SQL query walks into a bar, sees two tables, and asks: Can I join you?",
        "Why do programmers hate nature? Too many bugs.",
        "What’s a programmer’s favorite place to hang out? The Foo Bar.",
        "How do you comfort a JavaScript bug? You console it.",
        "Why was the developer unhappy at their job? They wanted arrays.",
        "Why do programmers always mix up Christmas and Halloween? Because Oct 31 == Dec 25.",
        "What is a programmer’s favorite type of music? Algo-rhythm.",
        "Why was the function sad? It didn’t get called."
    ]

    func fetchRandomJoke() {
        if let randomJoke = jokes.randomElement() {
            joke = Joke(text: randomJoke)
        }
    }

    func addToFavorites() {
        if let joke = joke, !favorites.contains(where: { $0.text == joke.text }) {
            favorites.append(joke)
        }
    }

    func deleteFromFavorites(jokeToDelete: Joke) {
        favorites.removeAll { $0.text == jokeToDelete.text }
    }
}
