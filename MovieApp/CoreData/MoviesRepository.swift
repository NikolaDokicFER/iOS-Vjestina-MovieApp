//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//

import Foundation
import CoreData

class MoviesRepository{
    private var moviesDatabaseDataSource: MoviesDatabaseDataSource!
    private var moviesNetworkDataSource: MoviesNetworkDataSource!
    
    init(){
        moviesDatabaseDataSource = MoviesDatabaseDataSource()
        moviesNetworkDataSource = MoviesNetworkDataSource()
    }
    
    
    func getMovies() -> [Movie]{
        moviesDatabaseDataSource.fetchMovies().map { Movie(fromModel: $0) }
    }
    
    func getFilteredMovies(input: String) -> [Movie]{
        lazy var movies: [Movie] = {
            let moviesModel = moviesDatabaseDataSource.fetchFilteredMovies(input: input)
        return moviesModel.map { Movie(fromModel: $0) }
        }()
        
        return movies
    }
    
    func saveMovies(movies: [Movie]){
        moviesDatabaseDataSource.saveMovie(moviesGiven: movies)
    }
    
    func doesExist(id: Int32) -> Bool{
        return moviesDatabaseDataSource.checkIfExists(id: id)
    }
    
    func getFavoriteMovies() -> [Movie]{
        lazy var movies: [Movie] = {
            let moviesModel = moviesDatabaseDataSource.fetchFavoriteMovies()
        return moviesModel.map { Movie(fromModel: $0) }
        }()
        
        return movies
    }
    
    func setMovieFavorite(id: Int32, favorite: Bool){
        moviesDatabaseDataSource.setMovieFavorite(id: id, favorite: favorite)
    }
    
    func checkIfFavorite(id: Int32) -> Bool?{
        return moviesDatabaseDataSource.fetchFavorite(id: id)
    }
    
    func getMovieById(id: Int32) -> Movie{
        lazy var movie: Movie = {
            let moviesModel = moviesDatabaseDataSource.fetchMovie(id: id)
            return moviesModel.map { Movie(fromModel: $0) }!
        }()
        
        return movie
    }
}
