//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Nikola Đokić on 29.03.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController{
    
    private var moviePoster: UIImageView!
    private var movieDetails: MoviewImageView!
    private var movieImageView: UIView!
    private var movieOverviewView: MoviewOverviewView!
    private var tableView: UITableView!
    private var movieId: Int!
    private var navigationBarAppName: UIView!
    private var navigationBarImage: UIImageView!
    private var navBarAppearance: UINavigationBarAppearance!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .blue
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        fetchData(urlString: "https://api.themoviedb.org/3/movie/" + String(movieId) + "?language=en-US&page=1&api_key=225631dc133673048d4a801ff6951584")

        buildViews()
        styleViews()
        constraintViews()
    }
    
    private func buildViews() {
        tableView = UITableView()
        view.addSubview(tableView)
        
        movieImageView = UIView()
        tableView.addSubview(movieImageView)
        
        
        navigationBarAppName = UIView()
        navigationBarImage = UIImageView(image: UIImage(named: "NavBarAppLogo"))
        navigationBarAppName.addSubview(navigationBarImage)
        
        navBarAppearance = UINavigationBarAppearance()
    }
    
    private func styleViews(){
        tableView.backgroundColor = .white
        
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView = navigationBarAppName
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
    }
    
    private func constraintViews(){
        tableView.snp.makeConstraints(){
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        movieImageView.snp.makeConstraints(){
            $0.top.leading.trailing.equalTo(tableView)
            $0.height.equalToSuperview().dividedBy(2.5)
            $0.width.equalToSuperview()
        }
        
        navigationBarImage.snp.makeConstraints(){
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(170)
        }
    }
    
    public func setMovieId(movieId: Int){
        self.movieId = movieId
    }
    
    private func fetchData(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let netowrkservice = NetworkService()
        
        netowrkservice.executeUrlRequest(request) { (result: Result<MovieDetails, RequestError>) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let value):
                
                guard let data = try? Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/original" + value.backdrop_path)!) else {return}
                
                self.moviePoster = UIImageView(image: UIImage(data: data))
                self.movieImageView.addSubview(self.moviePoster)
                
                self.moviePoster.contentMode = .scaleAspectFill
                self.moviePoster.clipsToBounds = true
                
                self.moviePoster.snp.makeConstraints(){
                    $0.edges.equalToSuperview()
                }
                
                self.movieDetails = MoviewImageView(movieDetails: value)
                self.movieImageView.addSubview(self.movieDetails)
                self.movieDetails.snp.makeConstraints(){
                    $0.edges.equalToSuperview()
                }
                
                self.movieOverviewView = MoviewOverviewView(movieDetails: value)
                self.tableView.addSubview(self.movieOverviewView)
                self.movieOverviewView.snp.makeConstraints(){
                    $0.top.equalTo(self.movieImageView.snp.bottom)
                    $0.leading.trailing.bottom.equalTo(self.tableView)
                    $0.width.equalToSuperview()
                }
            }
        }
    }
}
