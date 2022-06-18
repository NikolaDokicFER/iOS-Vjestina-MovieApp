//
//  FavoriteMoviesView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 27.05.2022..
//

import Foundation
import SnapKit
import UIKit

class FavoriteMoviesView: UIView, UICollectionViewDelegate, UICollectionViewDataSource{
   
    private var movies: [Movie] = []
    private var favoriteCollectionView: UICollectionView!
    public var selectedMovieDelegate: SelectedMovieDelegate!
    private var favoriteCollectionLayout: UICollectionViewFlowLayout!
    
    init(movies: [Movie]){
        super.init(frame: CGRect.zero)
        
        self.movies = movies
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setMovies(movies: [Movie]){
        self.movies = movies
        favoriteCollectionView.reloadData()
    }
    
    private func buildViews(){
        favoriteCollectionLayout = UICollectionViewFlowLayout()
        
        favoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: favoriteCollectionLayout)
        favoriteCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.id)
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.delegate = self
        self.addSubview(favoriteCollectionView)
    }
    
    private func styleViews(){
        favoriteCollectionLayout.itemSize = CGSize(width: 105, height: 155)
        
        favoriteCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func constraintViews(){
        favoriteCollectionView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
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
        selectedMovieDelegate.selectedMovieId(movieId: Int(movies[indexPath.row].id))
    }
}
