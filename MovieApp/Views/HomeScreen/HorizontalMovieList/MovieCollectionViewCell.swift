//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 13.04.2022..
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell{
    
    static let id = String(describing: MovieCollectionViewCell.self)
    private var moviePoster: UIImageView!
    private var favoriteButton: UIButton!
    private var favorite: Bool!
    private var moviesRepository: MoviesRepository!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.isUserInteractionEnabled = true
        moviesRepository = MoviesRepository()
        
        moviePoster = UIImageView()
        self.addSubview(moviePoster)
        
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        
        favoriteButton = UIButton()
        self.addSubview(favoriteButton)
        
        favoriteButton.layer.cornerRadius = 12
        favoriteButton.tintColor = .white
        favoriteButton.backgroundColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 0.6)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureMoviePoster(movieData: Movie){

        moviePoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original" + movieData.poster_path))
        
        favorite = moviesRepository.checkIfFavorite(id: movieData.id)
        
        if(favorite){
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        moviePoster.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
        favoriteButton.snp.makeConstraints(){
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(5)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
    }
    
    public func setAction(id: Int32){
        favoriteButton.addAction(.init{_ in
            if(self.favorite){
                self.moviesRepository.setMovieFavorite(id: Int32(id), favorite: false)
                self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                self.favorite = false
            }else{
                self.moviesRepository.setMovieFavorite(id: Int32(id), favorite: true)
                self.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.favorite = true
            }
        }, for: .touchUpInside)
    }
}
