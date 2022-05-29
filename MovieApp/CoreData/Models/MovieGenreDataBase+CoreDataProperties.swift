//
//  MovieGenreDataBase+CoreDataProperties.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//
//

import Foundation
import CoreData


extension MovieGenreDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieGenreDataBase> {
        return NSFetchRequest<MovieGenreDataBase>(entityName: "MovieGenreDataBase")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var movies: NSSet?

}

// MARK: Generated accessors for movies
extension MovieGenreDataBase {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieDataBase)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieDataBase)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension MovieGenreDataBase : Identifiable {

}
