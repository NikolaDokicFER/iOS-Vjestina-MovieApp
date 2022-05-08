//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Nikola Đokić on 29.03.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController{
    
    private var moviePoster: UIImageView!
    private var movieDetails: MoviewImageView!
    private var movieImageView: UIView!
    private var movieOverviewView: MoviewOverviewView!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    private func buildViews() {
        tableView = UITableView()
        view.addSubview(tableView)
        
        movieImageView = UIView()
        tableView.addSubview(movieImageView)
        
        moviePoster = UIImageView(image: UIImage(named: "IronMan.png"))
        movieImageView.addSubview(moviePoster)
        
        movieDetails = MoviewImageView()
        movieImageView.addSubview(movieDetails)
        
        movieOverviewView = MoviewOverviewView()
        tableView.addSubview(movieOverviewView)
    }
    
    private func styleViews(){
        tableView.backgroundColor = .white
        
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.clipsToBounds = true
    }
    
    private func constraintViews(){
        tableView.snp.makeConstraints(){
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        movieImageView.snp.makeConstraints(){
            $0.top.leading.trailing.equalTo(tableView)
            $0.height.equalToSuperview().dividedBy(2.5)
            $0.width.equalToSuperview()
        }
        
        moviePoster.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
        movieDetails.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
        movieOverviewView.snp.makeConstraints(){
            $0.top.equalTo(movieImageView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(tableView)
            $0.width.equalToSuperview()
        }
    }
}
