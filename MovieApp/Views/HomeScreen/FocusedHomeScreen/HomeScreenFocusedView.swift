//
//  HomeScreenFocusedView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.04.2022..
//

import Foundation
import UIKit
import SnapKit

class HomeScreenFocusedView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var homeCollectionView: UICollectionView!
    private var homeCollectionViewLayout: UICollectionViewFlowLayout!
    public var selectedMovieDelegate: SelectedMovieDelegate!
    private var moviesRepository: MoviesRepository!
    private var movies: [Movie]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        moviesRepository = MoviesRepository()
        movies = moviesRepository.getMovies()
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        homeCollectionViewLayout = UICollectionViewFlowLayout()
        
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: homeCollectionViewLayout)
        
        homeCollectionView.register(FocusedHomeCollectionViewCell.self, forCellWithReuseIdentifier: FocusedHomeCollectionViewCell.id)
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        self.addSubview(homeCollectionView)
    }
    
    private func styleViews(){
        homeCollectionViewLayout.scrollDirection = .vertical
        homeCollectionViewLayout.itemSize = CGSize(width: 370, height: 150)
        homeCollectionView.showsVerticalScrollIndicator = false
    }
    
    private func constraintViews(){
        homeCollectionView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
    
    public func setMovies(input: String){
        if(!input.isEmpty){ movies = moviesRepository.getFilteredMovies(input: input)}
        else{movies = moviesRepository.getMovies()}
        homeCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FocusedHomeCollectionViewCell.id, for: indexPath) as! FocusedHomeCollectionViewCell
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        cell.configureMovie(movie: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMovieDelegate.selectedMovieId(movieId: Int(movies[indexPath.row].id))
    }
}

