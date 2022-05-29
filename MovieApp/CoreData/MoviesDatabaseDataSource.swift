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
    private var appDelegate: AppDelegate
    
    init(){
        appDelegate = AppDelegate()
    }
    
    func saveMovie(movieGiven: Movie){
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "MovieDataBase", in: managedContext)!
        
        let movie: MovieDataBase
        
        if(checkIfExists(id: movieGiven.id)){
            movie = fetchMovie(id: movieGiven.id)!
        }else{
            movie = MovieDataBase(entity: entity, insertInto: managedContext)
            movie.favourite = false
        }
        
        movie.title = movieGiven.title
        movie.overview = movieGiven.overview
        movie.poster_path = movieGiven.poster_path
        movie.backdrop_path =  movieGiven.backdrop_path
        movie.genre_ids =  movieGiven.genre_ids as NSObject
        movie.popularity =  movieGiven.popularity
        movie.release_date =  movieGiven.release_date
        movie.id = movieGiven.id
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    
    func setMovieFavorite(id: Int32, favorite: Bool){
        let managedContext = appDelegate.persistentContainer.viewContext
        
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
        let managedContext = appDelegate.persistentContainer.viewContext
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
        let managedContext = appDelegate.persistentContainer.viewContext
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
        let managedContext = appDelegate.persistentContainer.viewContext
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
        let managedContext = appDelegate.persistentContainer.viewContext
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
        let managedContext = appDelegate.persistentContainer.viewContext
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
        let managedContext = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", "\(id)")
        request.predicate = predicate
        request.fetchLimit = 1
        
        do {
            return try managedContext.fetch(request).first?.favourite
        }
        catch {
            print("error executing fetch request: \(error)")
            return nil
        }
    }
}
