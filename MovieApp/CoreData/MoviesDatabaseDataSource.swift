//
//  MoviesDatabaseDataSource.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//

import Foundation
import CoreData

class MoviesDatabaseDataSource{
    private var movies: [MovieDataBase] = []
    private var coreDataStack = CoreDataStack()
    
    init(){}
    
    func saveMovie(moviesGiven: [Movie]){
        let managedContext = coreDataStack.persistentContainer.viewContext
        
        for movie in moviesGiven{
            var newMovie = NSEntityDescription.insertNewObject(forEntityName: "MovieDataBase", into: managedContext)
            
            if(checkIfExists(id: movie.id)){
                guard let existingMovie = fetchMovie(id: movie.id) else{return}
                newMovie = existingMovie
            }else{
                newMovie.setValue(false, forKey: "favourite")
            }
            
            newMovie.setValue(movie.title, forKey: "title")
            newMovie.setValue(movie.overview, forKey: "overview")
            newMovie.setValue(movie.poster_path, forKey: "posterPath")
            newMovie.setValue(movie.backdrop_path, forKey: "backdropPath")
            newMovie.setValue(movie.genre_ids, forKey: "genreIds")
            newMovie.setValue(movie.popularity, forKey: "popularity")
            newMovie.setValue(movie.release_date, forKey: "releaseDate")
            newMovie.setValue(movie.id, forKey: "id")

        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    
    func setMovieFavorite(id: Int32, favorite: Bool){
        let managedContext = coreDataStack.persistentContainer.viewContext
        
        let movie: MovieDataBase
        
        if(checkIfExists(id: id)){
            movie = fetchMovie(id: id)!
            movie.favourite = favorite
        }else{
            print("Movie does not exist")
            return
        }
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    
    func fetchMovies() -> [MovieDataBase] {
        let managedContext = coreDataStack.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        
        do {
            let movies = try managedContext.fetch(request)
            return movies
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func fetchMovie(id: Int32) -> MovieDataBase? {
        let managedContext = coreDataStack.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", "\(id)")
        request.predicate = predicate
        request.fetchLimit = 1

        do {
            return try managedContext.fetch(request).first
        }
        catch {
            print("error executing fetch request: \(error)")
            return nil
        }
    }
    
    func fetchFilteredMovies(input: String) -> [MovieDataBase]{
        let managedContext = coreDataStack.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        let filter = NSPredicate(format: "title contains [cd] %@", input)
        request.predicate = filter
        
        do{
            let movies = try managedContext.fetch(request)
            return movies
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func fetchFavoriteMovies() -> [MovieDataBase]{
        let managedContext = coreDataStack.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        let predicate = NSPredicate(format: "favourite = %d", true)
        request.predicate = predicate

        do {
            return try managedContext.fetch(request)
        }
        catch {
            print("error executing fetch request: \(error)")
            return []
        }
    }
    
    func checkIfExists(id: Int32) -> Bool {
        let managedContext = coreDataStack.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", "\(id)")
        request.predicate = predicate
        
        var results: [MovieDataBase] = []

        do {
            results = try managedContext.fetch(request)
        }
        catch {
            print("error executing fetch request: \(error)")
        }

        return results.count > 0

    }
    
    func fetchFavorite(id: Int32) -> Bool?{
        let movie = fetchMovie(id: id)
        
        return movie?.favourite
    }
}
