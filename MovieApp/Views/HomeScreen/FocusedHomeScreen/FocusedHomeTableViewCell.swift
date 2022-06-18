//
//  focusedHomeTableViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.04.2022..
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class FocusedHomeCollectionViewCell: UICollectionViewCell{
    
    static let id = String(describing: FocusedHomeCollectionViewCell.self)
    private var moviePoster: UIImageView!
    private var movieTitle: UILabel!
    private var movieDescription: UILabel!
    private var shadow: UIView!
    private var shapes: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureMovie(movie: Movie){
        shadow = UIView()
        self.contentView.addSubview(shadow)
        
        shapes = UIView()
        self.contentView.addSubview(shapes)
        
        createShadows()
        
        moviePoster = UIImageView()
        moviePoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original" + movie.poster_path))
        shapes.addSubview(moviePoster)
        
        movieTitle = UILabel()
        movieTitle.text = movie.title
        shapes.addSubview(movieTitle)
        
        movieDescription = UILabel()
        movieDescription.text = movie.overview
        shapes.addSubview(movieDescription)
        
        styleViews()
        constraintViews()
    }
    
    private func createShadows(){
        shadow.frame = self.contentView.frame
        shadow.clipsToBounds = false
        
        let layer0 = CALayer()
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 20
        layer0.position = shadow.center
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds  = shadow.bounds
        layer0.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        
        shadow.layer.addSublayer(layer0)
        
        shapes.frame = self.contentView.frame
        shapes.clipsToBounds = true
        
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.cornerRadius = 10
        
        shapes.layer.addSublayer(layer1)
        
        shapes.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func styleViews(){
        moviePoster.layer.masksToBounds = true
        
        movieTitle.font = UIFont.boldSystemFont(ofSize: 16)
        
        movieDescription.numberOfLines = 5
        movieDescription.textColor = UIColor(red: 0.509, green: 0.509, blue: 0.509, alpha: 1)
        movieDescription.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func constraintViews(){
        shadow.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
        shapes.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
        moviePoster.snp.makeConstraints(){
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        movieTitle.snp.makeConstraints(){
            $0.leading.equalTo(moviePoster.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
        }
        
        movieDescription.snp.makeConstraints(){
            $0.leading.equalTo(movieTitle)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(movieTitle.snp.bottom).offset(10)
        }
        
    }
}
