//
//  Movie.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//

struct Movie: Codable{
    let id: Int32
    let title: String
    let release_date: String
    let overview: String
    let popularity: Double
    let genre_ids: [Int16]
    let backdrop_path: String
    let poster_path: String
    
    init(fromModel model: MovieDataBase) {
        self.id = model.id
        self.title = model.title!
        self.release_date = model.release_date!
        self.overview = model.overview!
        self.popularity = model.popularity
        self.genre_ids = (model.genre_ids as? [Int16])!
        self.backdrop_path = model.backdrop_path!
        self.poster_path = model.poster_path!
    }
}
