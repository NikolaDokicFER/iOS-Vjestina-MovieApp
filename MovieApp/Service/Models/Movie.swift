//
//  Movie.swift
//  MovieApp
//
//  Created by Nikola Đokić on 08.05.2022..
//

struct Movie: Codable{
    let id: Int
    let title: String
    let release_date: String
    let overview: String
    let popularity: Float
    let genre_ids: [Int]
    let backdrop_path: String
    let poster_path: String
}
