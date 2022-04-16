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
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
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
        userScorePercentage.text = "76%"
        userScorePercentage.textColor = .white
        userScorePercentage.font = UIFont.boldSystemFont(ofSize: 20)
        
        userScore.text = "User Score"
        userScore.textColor = .white
        userScore.font = UIFont.boldSystemFont(ofSize: 20)
        
        movieName.text = "Iron man (2008)"
        movieName.textColor = .white
        movieName.font = UIFont.boldSystemFont(ofSize: 30)
        
        date.text = "05/02/2008 (US)"
        date.textColor = .white
        
        genres.text = "Action, Science Fiction, Adventure"
        genres.textColor = .white
        
        runTime.text = "2h 6m"
        runTime.textColor = .white
        runTime.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func constraintViews(){
        ring.snp.makeConstraints(){
            $0.bottom.equalTo(userScorePercentage.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(userScorePercentage).offset(-10)
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
            $0.bottom.equalTo(runTime)
            $0.leading.equalToSuperview().offset(18)
        }

        runTime.snp.makeConstraints(){
            $0.bottom.equalTo(favourite.snp.top).offset(-10)
            $0.leading.equalTo(genres.snp.trailing).offset(10)
        }

        favourite.snp.makeConstraints(){
            $0.bottom.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
    }
}
