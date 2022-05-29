//
//  MovieOverviewView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 11.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MoviewOverviewView: UIView{
    
    private var descriptionTitle: UILabel!
    private var movieDescription: UILabel!
    private var movieDetails: MovieDetails!
    
    
    init(movieDetails: MovieDetails) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        
        self.movieDetails = movieDetails
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews(){
        descriptionTitle = UILabel()
        self.addSubview(descriptionTitle)
        
        movieDescription = UILabel()
        self.addSubview(movieDescription)
    }
    
    private func styleViews(){
        descriptionTitle.textColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        descriptionTitle.text = "Overview"
        descriptionTitle.font = UIFont.boldSystemFont(ofSize: 25)
        
        movieDescription.text = movieDetails.overview
        movieDescription.lineBreakMode = .byWordWrapping
        movieDescription.numberOfLines = 0
        movieDescription.textColor = .black
    }
    
    private func constraintViews(){
        descriptionTitle.snp.makeConstraints(){
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        movieDescription.snp.makeConstraints(){
            $0.top.equalTo(descriptionTitle.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
