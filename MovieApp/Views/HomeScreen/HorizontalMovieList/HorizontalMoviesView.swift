//
//  VerticalMovieScroll.swift
//  MovieApp
//
//  Created by Nikola Đokić on 12.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class HorizontalMoviesView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var movieCollectionView: UICollectionView!
    private var movieCollectionLayout: UICollectionViewFlowLayout!
    private var givenMovies: MovieList!
    public var selectMovieDelegate: SelectMovieDelegate!
    
    init(movies: MovieList){
        super.init(frame: CGRect.zero)
        
        givenMovies = movies
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return givenMovies.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.id, for: indexPath) as! MovieCollectionViewCell

        cell.configureMoviePoster(movieData: givenMovies.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMovieDelegate?.selectedMovieId(movieId: givenMovies.results[indexPath.row].id)
    }
}

protocol SelectMovieDelegate{
    func selectedMovieId(movieId: Int)
}