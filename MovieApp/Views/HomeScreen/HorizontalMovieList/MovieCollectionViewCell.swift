//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 13.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class MovieCollectionViewCell: UICollectionViewCell{
    
    static let id = String(describing: MovieCollectionViewCell.self)
    private var moviePoster: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureMoviePoster(movieData: Movie){
        guard let data = try? Data(contentsOf: URL(string: "https://image.tmdb.org/t/p/original" + movieData.poster_path)!) else {return}
        moviePoster = UIImageView(image: UIImage(data: data))
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        self.addSubview(moviePoster)
        
        moviePoster.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
}
