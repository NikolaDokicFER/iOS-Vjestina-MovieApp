//
//  MovieGroupDataBase+CoreDataProperties.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//
//

import Foundation
import CoreData


extension MovieGroupDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieGroupDataBase> {
        return NSFetchRequest<MovieGroupDataBase>(entityName: "MovieGroupDataBase")
    }

    @NSManaged public var name: String?
    @NSManaged public var movies: NSSet?

}

// MARK: Generated accessors for movies
extension MovieGroupDataBase {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: MovieDataBase)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: MovieDataBase)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension MovieGroupDataBase : Identifiable {

}
