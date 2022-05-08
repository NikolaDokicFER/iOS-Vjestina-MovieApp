//
//  Result.swift
//  MovieApp
//
//  Created by Nikola Đokić on 07.05.2022..
//

import Foundation

enum Result<Success, Failure> where Failure: Error{
    case success(Success)
    
    case failure(Failure)
}
