//
//  RequestError.swift
//  MovieApp
//
//  Created by Nikola Đokić on 07.05.2022..
//

import Foundation

enum RequestError: Error{
    case clientError
    case serverError
    case noDataError
    case decodingError
}
