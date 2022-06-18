//
//  MovieDataBase+CoreDataProperties.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.06.2022..
//
//

import Foundation
import CoreData

extension MovieDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDataBase> {
        return NSFetchRequest<MovieDataBase>(entityName: "MovieDataBase")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var favourite: Bool
    @NSManaged public var genreIds: [Int16]?
    @NSManaged public var id: Int32
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var video: String?
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int32
    @NSManaged public var movie_genres: NSSet?
    @NSManaged public var movie_groups: NSSet?

}

// MARK: Generated accessors for movie_genres
extension MovieDataBase {

    @objc(addMovie_genresObject:)
    @NSManaged public func addToMovie_genres(_ value: MovieGenreDataBase)

    @objc(removeMovie_genresObject:)
    @NSManaged public func removeFromMovie_genres(_ value: MovieGenreDataBase)

    @objc(addMovie_genres:)
    @NSManaged public func addToMovie_genres(_ values: NSSet)

    @objc(removeMovie_genres:)
    @NSManaged public func removeFromMovie_genres(_ values: NSSet)

}

// MARK: Generated accessors for movie_groups
extension MovieDataBase {

    @objc(addMovie_groupsObject:)
    @NSManaged public func addToMovie_groups(_ value: MovieGroupDataBase)

    @objc(removeMovie_groupsObject:)
    @NSManaged public func removeFromMovie_groups(_ value: MovieGroupDataBase)

    @objc(addMovie_groups:)
    @NSManaged public func addToMovie_groups(_ values: NSSet)

    @objc(removeMovie_groups:)
    @NSManaged public func removeFromMovie_groups(_ values: NSSet)

}

extension MovieDataBase : Identifiable {

}
