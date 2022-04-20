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
    
    private var imageView: UIImageView!
    private var overviewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildViews()
    }
    
    private func buildViews() {
        imageView = UIImageView(image: UIImage(named: "IronMan.png"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        overviewView = UIView()
        overviewView.backgroundColor = .white
        view.addSubview(overviewView)
        
        imageView.snp.makeConstraints(){
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2.5)
        }
        
        overviewView.snp.makeConstraints(){
            $0.top.equalTo(imageView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(imageView)
        }
        
        buildImageView()
        buildOverviewView()
    }
    
    private func buildImageView(){
        let ring = UIImageView(image: UIImage(named: "GreenRing.png"))
        imageView.addSubview(ring)
    
        let userScorePercentage = UILabel()
        userScorePercentage.text = "76%"
        userScorePercentage.textColor = .white
        userScorePercentage.font = UIFont.boldSystemFont(ofSize: 20)
        imageView.addSubview(userScorePercentage)
        
        let userScore = UILabel()
        userScore.text = "User Score"
        userScore.textColor = .white
        userScore.font = UIFont.boldSystemFont(ofSize: 20)
        imageView.addSubview(userScore)
        
        let movieName = UILabel()
        movieName.text = "Iron man (2008)"
        movieName.textColor = .white
        movieName.font = UIFont.boldSystemFont(ofSize: 30)
        imageView.addSubview(movieName)
        
        let date = UILabel()
        date.text = "05/02/2008 (US)"
        date.textColor = .white
        imageView.addSubview(date)
        
        let genres = UILabel()
        genres.text = "Action, Science Fiction, Adventure"
        genres.textColor = .white
        imageView.addSubview(genres)
        
        let runTime = UILabel()
        runTime.text = "2h 6m"
        runTime.textColor = .white
        runTime.font = UIFont.boldSystemFont(ofSize: 16)
        imageView.addSubview(runTime)
        
        let favourite = UIImageView(image: UIImage(named: "Favourite.svg"))
        imageView.addSubview(favourite)
        
        ring.snp.makeConstraints(){
            $0.top.equalToSuperview().offset(107)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        userScorePercentage.snp.makeConstraints(){
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(32)
            $0.width.equalTo(50)
        }
        
        userScore.snp.makeConstraints(){
            $0.top.equalTo(userScorePercentage)
            $0.leading.equalTo(userScorePercentage.snp.trailing).offset(10)
            $0.height.equalTo(32)
            $0.width.equalTo(140)
        }

        movieName.snp.makeConstraints(){
            $0.top.equalTo(userScorePercentage.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(35)
            $0.width.equalTo(300)
        }

        date.snp.makeConstraints(){
            $0.top.equalTo(movieName.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(35)
            $0.width.equalTo(250)
        }

        genres.snp.makeConstraints(){
            $0.top.equalTo(date.snp.bottom).offset(-10)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(35)
            $0.width.equalTo(270)
        }

        runTime.snp.makeConstraints(){
            $0.top.equalTo(genres)
            $0.leading.equalTo(genres.snp.trailing)
            $0.height.equalTo(35)
            $0.width.equalTo(50)
        }

        favourite.snp.makeConstraints(){
            $0.top.equalTo(genres.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
    }
    
    private func buildOverviewView(){
        let overviewLabel1 = UILabel()
        overviewLabel1.textColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        overviewLabel1.text = "Overview"
        overviewLabel1.font = UIFont.boldSystemFont(ofSize: 25)
        overviewView.addSubview(overviewLabel1)
        
        let overviewLabel2 = UILabel()
        overviewLabel2.text = "After being held captive in an Afghan cave, billionare engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        overviewLabel2.lineBreakMode = .byWordWrapping
        overviewLabel2.numberOfLines = 0
        overviewView.addSubview(overviewLabel2)
        
        let personLabel1 = UILabel()
        personLabel1.text = "Don Heck"
        personLabel1.font = UIFont.boldSystemFont(ofSize: 16)
        let personLabel2 = UILabel()
        personLabel2.text = "Jack Kirby"
        personLabel2.font = UIFont.boldSystemFont(ofSize: 16)
        let personLabel3 = UILabel()
        personLabel3.text = "Jon Favreau"
        personLabel3.font = UIFont.boldSystemFont(ofSize: 16)
        let personLabel4 = UILabel()
        personLabel4.text = "Don Heck"
        personLabel4.font = UIFont.boldSystemFont(ofSize: 16)
        let personLabel5 = UILabel()
        personLabel5.text = "Jack Macrum"
        personLabel5.font = UIFont.boldSystemFont(ofSize: 16)
        let personLabel6 = UILabel()
        personLabel6.text = "Matt Holloway"
        personLabel6.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        let roleLabel1 = UILabel()
        roleLabel1.text = "Characters"
        let roleLabel2 = UILabel()
        roleLabel2.text = "Characters"
        let roleLabel3 = UILabel()
        roleLabel3.text = "Director"
        let roleLabel4 = UILabel()
        roleLabel4.text = "Screenplay"
        let roleLabel5 = UILabel()
        roleLabel5.text = "Screenplay"
        let roleLabel6 = UILabel()
        roleLabel6.text = "Screenplay"
        

        let stackView1 = UIStackView()
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.spacing = 20
        stackView1.alignment = .fill
        stackView1.addArrangedSubview(personLabel1)
        stackView1.addArrangedSubview(personLabel2)
        stackView1.addArrangedSubview(personLabel3)
        
        let stackView2 = UIStackView()
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.spacing = 20
        stackView2.addArrangedSubview(roleLabel1)
        stackView2.addArrangedSubview(roleLabel2)
        stackView2.addArrangedSubview(roleLabel3)
        
        let stackView3 = UIStackView()
        stackView3.axis = .horizontal
        stackView3.distribution = .fillEqually
        stackView3.spacing = 20
        stackView3.addArrangedSubview(personLabel4)
        stackView3.addArrangedSubview(personLabel5)
        stackView3.addArrangedSubview(personLabel6)
        
        let stackView4 = UIStackView()
        stackView4.axis = .horizontal
        stackView4.distribution = .fillEqually
        stackView4.spacing = 20
        stackView4.addArrangedSubview(roleLabel4)
        stackView4.addArrangedSubview(roleLabel5)
        stackView4.addArrangedSubview(roleLabel6)
        
        
        overviewView.addSubview(stackView1)
        overviewView.addSubview(stackView2)
        overviewView.addSubview(stackView3)
        overviewView.addSubview(stackView4)

        
        overviewLabel1.snp.makeConstraints(){
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalToSuperview()
        }
        
        overviewLabel2.snp.makeConstraints(){
            $0.top.equalTo(overviewLabel1.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(100)
        }
        
        stackView1.snp.makeConstraints(){
            $0.top.equalTo(overviewLabel2.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        
        stackView2.snp.makeConstraints(){
            $0.top.equalTo(stackView1.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        
        stackView3.snp.makeConstraints(){
            $0.top.equalTo(stackView2.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        
        stackView4.snp.makeConstraints(){
            $0.top.equalTo(stackView3.snp.bottom)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
    }
}
