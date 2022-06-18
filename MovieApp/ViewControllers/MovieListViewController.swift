//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Nikola Đokić on 12.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieListViewController: UIViewController, SelectedMovieDelegate{
        
    private var moviesRepository = MoviesRepository()
    private var searchBarView: SearchBarView!
    private var homeScreenMoviesView: HomeScreenMoviesView!
    private var focusedHomeScreenView: HomeScreenFocusedView!
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
            
        buildViews()
        styleViews()
        constraintViews()
    }
    
    private func buildViews(){
        searchBarView = SearchBarView(controller: self)
        view.addSubview(searchBarView)
        
        homeScreenMoviesView = HomeScreenMoviesView()
        homeScreenMoviesView.selectedMovieDelegate = self
        view.addSubview(homeScreenMoviesView)
        
        let movies = moviesRepository.getMovies()
        
        focusedHomeScreenView = HomeScreenFocusedView(movies: movies)
        focusedHomeScreenView.selectedMovieDelegate = self
        view.addSubview(focusedHomeScreenView)
        
        navigationBarAppName = UIView()
        navigationBarImage = UIImageView(image: UIImage(named: "NavBarAppLogo"))
        navigationBarAppName.addSubview(navigationBarImage)
        
        navBarAppearance = UINavigationBarAppearance()
        
        searchBarView.userInputField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
    }
    
    private func styleViews(){
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        navigationItem.titleView = navigationBarAppName
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
    }
    
    private func constraintViews(){
        searchBarView.snp.makeConstraints(){
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        homeScreenMoviesView.snp.makeConstraints(){
            $0.top.equalTo(searchBarView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        navigationBarImage.snp.makeConstraints(){
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(170)
        }
    }
    
    @objc func textFieldChanged(_ textField: UITextField){
        let movies:[Movie]
        if(!textField.text!.isEmpty){
            movies = moviesRepository.getFilteredMovies(input: textField.text!)
        }
        else{
            movies = moviesRepository.getMovies()
        }
        focusedHomeScreenView.setMovies(movies: movies)
    }
    
    public func updateLayout(searchBarActive: Bool){
        if(searchBarActive){
            homeScreenMoviesView.snp.removeConstraints()
            
            focusedHomeScreenView.snp.makeConstraints(){
                $0.top.equalTo(searchBarView.snp.bottom).offset(20)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }else{
            focusedHomeScreenView.snp.removeConstraints()
            
            homeScreenMoviesView.snp.makeConstraints(){
                $0.top.equalTo(searchBarView.snp.bottom)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
    
    func selectedMovieId(movieId: Int) {
        let vc = MovieDetailsViewController()
        vc.setMovieId(movieId: movieId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
