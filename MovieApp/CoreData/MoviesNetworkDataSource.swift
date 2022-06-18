//
//  MoviesNetworkDataSource.swift
//  MovieApp
//
//  Created by Nikola Đokić on 26.05.2022..
//

import Foundation

class MoviesNetworkDataSource{
    
    func fetchMovies(path: String, completionHandler: @escaping (Result<MovieList, RequestError>) -> Void){
        guard let url = URL(string: path) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        executeUrlRequest(request, completionHandler: completionHandler)
    }
    
    func fetchGenre(path: String, completionHandler: @escaping (Result<GenreList, RequestError>) -> Void){
        guard let url = URL(string: path) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        executeUrlRequest(request, completionHandler: completionHandler)
    }
    
    func fetchMovieDetails(path: String, completionHandler: @escaping (Result<MovieDetails, RequestError>) -> Void){
        guard let url = URL(string: path) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        executeUrlRequest(request, completionHandler: completionHandler)
    }
    
    func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (Result<T, RequestError>) -> Void){
        
        let urlTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else{
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...209).contains(httpResponse.statusCode) else{
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            
            guard let value = try? JSONDecoder().decode(T.self, from: data) else{
                completionHandler(.failure(.decodingError))
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(.success(value))
            }
        }
        
        urlTask.resume()
    }
    
    
}
