//
//  MovieDetails.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//

struct MovieDetails: Codable{
    let id: Int
    let title: String
    let release_date: String
    let overview: String
    let popularity: Float
    let genres: [Genre]
    let backdrop_path: String
    let poster_path: String
    let runtime: Int
    let vote_average: Float
}
