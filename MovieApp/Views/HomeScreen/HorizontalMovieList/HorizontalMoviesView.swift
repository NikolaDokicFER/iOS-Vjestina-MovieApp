//
//  VerticalMovieScroll.swift
//  MovieApp
//
//  Created by Nikola Đokić on 12.04.2022..
//

import Foundation
import UIKit
import SnapKit

class HorizontalMoviesView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var moviesRepository: MoviesRepository!
    private var movieCollectionView: UICollectionView!
    private var movieCollectionLayout: UICollectionViewFlowLayout!
    private var movies: [Movie]!
    public var selectedMovieDelegate: SelectedMovieDelegate!
    
    override init(frame: CGRect){
        super.init(frame: frame) 
        
        moviesRepository = MoviesRepository()
        movies =  moviesRepository.getMovies()
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        movieCollectionLayout = UICollectionViewFlowLayout()
        
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: movieCollectionLayout)
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.id)
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        self.addSubview(movieCollectionView)
    }
    
    private func styleViews(){
        movieCollectionLayout.scrollDirection = .horizontal
        movieCollectionLayout.itemSize = CGSize(width: 125, height: 180)
        
        movieCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func constraintViews(){
        movieCollectionView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
    
    public func setMovies(movies: [Movie]){
        self.movies = movies
        movieCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.id, for: indexPath) as! MovieCollectionViewCell

        cell.configureMoviePoster(movieData: movies[indexPath.row])
        cell.setAction(id: movies[indexPath.row].id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMovieDelegate?.selectedMovieId(movieId: Int(movies[indexPath.row].id))
    }
}

protocol SelectedMovieDelegate{
    func selectedMovieId(movieId: Int)
}
