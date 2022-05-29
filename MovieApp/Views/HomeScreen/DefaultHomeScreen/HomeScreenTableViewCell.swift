//
//  HomeScreenTableViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.04.2022..
//

import Foundation
import UIKit
import SnapKit

class HomeScreenTableViewCell: UITableViewCell, SelectedMovieDelegate{
    
    private var moviesRepository: MoviesRepository!
    static let id = String(describing: HomeScreenTableViewCell.self)
    private var group: String!
    private var categoryText: MovieCategoryView!
    private var moviePosters: HorizontalMoviesView!
    private var movieList: MovieList!
    private var categoryTitle: String!
    public var selectedMovieDelegate: SelectedMovieDelegate!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.isUserInteractionEnabled = true
        moviesRepository = MoviesRepository()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureMovieGroup(group: String){
        moviePosters = HorizontalMoviesView()
        addSubview(moviePosters)
        moviePosters.selectedMovieDelegate = self
        
        switch group {
            case "popular":
                fetchData(urlString: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=225631dc133673048d4a801ff6951584")
                categoryTitle = "What's popular"
                fetchGenre()
            case "trending":
                fetchData(urlString: "https://api.themoviedb.org/3/trending/movie/week?api_key=225631dc133673048d4a801ff6951584&page=1")
                categoryTitle = "Trending"
            fetchGenre()
            case "topRated":
                fetchData(urlString: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=225631dc133673048d4a801ff6951584")
                categoryTitle = "Top Rated"
                fetchGenre()
            case "recommended":
                fetchData(urlString: "https://api.themoviedb.org/3/movie/103/recommendations?language=en-US&page=1&api_key=225631dc133673048d4a801ff6951584")
                categoryTitle =  "For You"
                fetchGenre()
            default:
                print("Wrong group")
        }
    }
    
    private func fetchData(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let netowrkservice = MoviesNetworkDataSource()
        
        netowrkservice.executeUrlRequest(request) { (result: Result<MovieList, RequestError>) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let value):
                let movies = value.results
                for movie in movies{
                    self.moviesRepository.saveMovie(movie: movie)
                }
                
                self.moviePosters.setMovies(movies: movies)
                
                self.moviePosters.snp.makeConstraints(){
                    $0.leading.trailing.equalToSuperview().inset(18)
                    $0.top.equalToSuperview().offset(70)
                    $0.height.equalTo(200)
                }
            }
        }
    }
    
    private func fetchGenre() {
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=225631dc133673048d4a801ff6951584") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let netowrkservice = MoviesNetworkDataSource()
        
        netowrkservice.executeUrlRequest(request) { (result: Result<GenreList, RequestError>) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let value):
                self.categoryText = MovieCategoryView(categoryTitleText: self.categoryTitle, genres: value)
                self.addSubview(self.categoryText)
                
                self.categoryText.snp.makeConstraints(){
                    $0.top.leading.trailing.equalToSuperview().inset(18)
                    $0.height.equalTo(100)
                }
            }
        }
    }
    
    
    func selectedMovieId(movieId: Int) {
        selectedMovieDelegate?.selectedMovieId(movieId: movieId)
    }
}

