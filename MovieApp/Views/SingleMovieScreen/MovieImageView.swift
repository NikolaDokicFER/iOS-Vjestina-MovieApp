//
//  MovieImageView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 11.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MoviewImageView: UIView{
    
    private var ring: UIImageView!
    private var userScorePercentage: UILabel!
    private var userScore: UILabel!
    private var movieName: UILabel!
    private var date: UILabel!
    private var genres: UILabel!
    private var runTime: UILabel!
    private var favourite: UIImageView!
    private var movieDetails: MovieDetails!
    
    init(movieDetails: MovieDetails){
        super.init(frame: CGRect.zero)
        
        self.movieDetails = movieDetails
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews(){
        ring = UIImageView(image: UIImage(named: "GreenRing.png"))
        self.addSubview(ring)
        
        userScorePercentage = UILabel()
        self.addSubview(userScorePercentage)
        
        userScore = UILabel()
        self.addSubview(userScore)
        
        movieName = UILabel()
        self.addSubview(movieName)
        
        date = UILabel()
        self.addSubview(date)
        
        genres = UILabel()
        self.addSubview(genres)
        
        runTime = UILabel()
        self.addSubview(runTime)
        
        favourite = UIImageView(image: UIImage(named: "Favourite.svg"))
        self.addSubview(favourite)
    }
    
    private func styleViews(){        
        userScorePercentage.text = String(movieDetails.vote_average)
        userScorePercentage.textColor = .white
        userScorePercentage.font = UIFont.boldSystemFont(ofSize: 20)
        
        userScore.text = "User Score"
        userScore.textColor = .white
        userScore.font = UIFont.boldSystemFont(ofSize: 20)
        
        movieName.text = movieDetails.title
        movieName.textColor = .white
        movieName.font = UIFont.boldSystemFont(ofSize: 30)
        
        date.text = movieDetails.release_date
        date.textColor = .white
        
        let genreList = movieDetails.genres
        var genreString = ""
        for genre in genreList{
            genreString += genre.name
            if(genre.name != genreList[genreList.count - 1].name){
                genreString += ", "
            }
        }

        genres.text = genreString
        genres.textColor = .white
        genres.lineBreakMode = .byWordWrapping
        genres.numberOfLines = 0
        
        runTime.text = String(movieDetails.runtime / 60) + " h " + String(movieDetails.runtime % 60) + " m"
        runTime.textColor = .white
        runTime.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func constraintViews(){
        ring.snp.makeConstraints(){
            $0.bottom.equalTo(userScorePercentage.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(userScorePercentage).offset(-17)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        userScorePercentage.snp.makeConstraints(){
            $0.bottom.equalTo(movieName.snp.top).offset(-10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        userScore.snp.makeConstraints(){
            $0.bottom.equalTo(userScorePercentage)
            $0.leading.equalTo(userScorePercentage.snp.trailing).offset(10)
        }

        movieName.snp.makeConstraints(){
            $0.bottom.equalTo(date.snp.top).offset(-10)
            $0.leading.equalToSuperview().offset(18)
        }

        date.snp.makeConstraints(){
            $0.bottom.equalTo(genres.snp.top).offset(-10)
            $0.leading.equalToSuperview().offset(18)
        }

        genres.snp.makeConstraints(){
            $0.bottom.equalTo(favourite.snp.top).offset(-5)
            $0.leading.trailing.equalToSuperview().offset(18)
        }

        runTime.snp.makeConstraints(){
            $0.bottom.equalTo(favourite.snp.bottom).inset(10)
            $0.leading.equalTo(favourite.snp.trailing).offset(20)
        }

        favourite.snp.makeConstraints(){
            $0.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
    }
    
    public func setMovieDetails(movieDetails: MovieDetails){
        self.movieDetails = movieDetails
    }
}
