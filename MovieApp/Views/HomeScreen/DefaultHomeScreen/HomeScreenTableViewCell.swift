//
//  HomeScreenTableViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class HomeScreenTableViewCell: UITableViewCell{
    
    static let id = "homeScreenViewCell"
    private var group: MovieGroup!
    private var categoryText: MovieCategoryView!
    private var moviePosters: HorizontalMoviesView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureMovieGroup(group: MovieGroup){
        switch group {
            case .popular:
                moviePosters = HorizontalMoviesView(group: group)
                categoryText = MovieCategoryView(categoryTitleText: "What's popular", buttonText1: "Streaming", buttonText2: "On TV", buttonText3: "For Rent", buttonText4: "In Theaters")
            case .freeToWatch:
                moviePosters = HorizontalMoviesView(group: group)
                categoryText = MovieCategoryView(categoryTitleText: "Free to Watch", buttonText1: "Movies", buttonText2: "Shows", buttonText3: "", buttonText4: "")
            case .trending:
                moviePosters = HorizontalMoviesView(group: group)
                categoryText = MovieCategoryView(categoryTitleText: "Trending", buttonText1: "Today", buttonText2: "This Week", buttonText3: "This Month", buttonText4: "All Time")
            case .topRated:
                moviePosters = HorizontalMoviesView(group: group)
                categoryText = MovieCategoryView(categoryTitleText: "Top Rated", buttonText1: "Movies", buttonText2: "Shows", buttonText3: "", buttonText4: "")
            case .upcoming:
                moviePosters = HorizontalMoviesView(group: group)
                categoryText = MovieCategoryView(categoryTitleText: "Coming soon", buttonText1: "Movies", buttonText2: "Shows", buttonText3: "", buttonText4: "")
        }
        
        self.addSubview(moviePosters)
        self.addSubview(categoryText)
        
        constraintViews()
    }
    
    private func constraintViews(){
        categoryText.snp.makeConstraints(){
            $0.top.leading.trailing.equalToSuperview().inset(18)
        }
        
        moviePosters.snp.makeConstraints(){
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(categoryText.snp.bottom).offset(5)
            $0.height.equalTo(200)
        }
    }
}
