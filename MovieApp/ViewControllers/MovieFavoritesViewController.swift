//
//  MovieFavouritesViewController.swift
//  MovieApp
//
//  Created by Nikola Đokić on 06.05.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieFavoritesViewController: UIViewController, SelectedMovieDelegate{
    
    private var favoriteLabel: UILabel!
    private var favoriteMoviesView: FavoriteMoviesView!
    private var navigationBarAppName: UIView!
    private var navigationBarImage: UIImageView!
    private var navBarAppearance: UINavigationBarAppearance!
    private var movieRepository = MoviesRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .blue
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteMoviesView.setMovies(movies: movieRepository.getFavoriteMovies())
    }
    
    private func buildViews(){
        favoriteLabel = UILabel()
        view.addSubview(favoriteLabel)
        
        let movies = movieRepository.getFavoriteMovies()
        
        favoriteMoviesView = FavoriteMoviesView(movies: movies)
        favoriteMoviesView.selectedMovieDelegate = self
        view.addSubview(favoriteMoviesView)
        
        navigationBarAppName = UIView()
        navigationBarImage = UIImageView(image: UIImage(named: "NavBarAppLogo"))
        navigationBarAppName.addSubview(navigationBarImage)
        
        navBarAppearance = UINavigationBarAppearance()
    }
    
    private func styleViews(){
        favoriteLabel.text = "Favorites"
        favoriteLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView = navigationBarAppName
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
    }
    
    private func constraintViews(){
        favoriteLabel.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().offset(20)
        })
        
        favoriteMoviesView.snp.makeConstraints({
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        })
        
        navigationBarImage.snp.makeConstraints(){
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(170)
        }
    }
    
    func selectedMovieId(movieId: Int) {
        let vc = MovieDetailsViewController()
        vc.setMovieId(movieId: movieId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
