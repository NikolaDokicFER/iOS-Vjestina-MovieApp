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
    private var stackViewUpper: UIStackView!
    private var stackViewLower: UIStackView!
    private var peopleContainer1: MoviePeopleView!
    private var peopleContainer2: MoviePeopleView!
    private var peopleContainer3: MoviePeopleView!
    private var peopleContainer4: MoviePeopleView!
    private var peopleContainer5: MoviePeopleView!
    private var peopleContainer6: MoviePeopleView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
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
        
        stackViewUpper = UIStackView()
        self.addSubview(stackViewUpper)
        
        stackViewLower = UIStackView()
        self.addSubview(stackViewLower)
        
        peopleContainer1 = MoviePeopleView(personString: "Don Heck", roleString: "Characters")
        peopleContainer2 = MoviePeopleView(personString: "Jack Kirby", roleString: "Characters")
        peopleContainer3 = MoviePeopleView(personString: "Jon Favreau", roleString: "Director")
        peopleContainer4 = MoviePeopleView(personString: "Don Heck", roleString: "Screenplay")
        peopleContainer5 = MoviePeopleView(personString: "Jack Macrum", roleString: "Screenplay")
        peopleContainer6 = MoviePeopleView(personString: "Matt Holloway", roleString: "Screenplay")
        
        stackViewUpper.addArrangedSubview(peopleContainer1)
        stackViewUpper.addArrangedSubview(peopleContainer2)
        stackViewUpper.addArrangedSubview(peopleContainer3)
        
        stackViewLower.addArrangedSubview(peopleContainer4)
        stackViewLower.addArrangedSubview(peopleContainer5)
        stackViewLower.addArrangedSubview(peopleContainer6)
    }
    
    private func styleViews(){
        descriptionTitle.textColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        descriptionTitle.text = "Overview"
        descriptionTitle.font = UIFont.boldSystemFont(ofSize: 25)
        
        movieDescription.text = "After being held captive in an Afghan cave, billionare engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        movieDescription.lineBreakMode = .byWordWrapping
        movieDescription.numberOfLines = 0
        movieDescription.textColor = .black
        
        
        stackViewUpper.axis = .horizontal
        stackViewUpper.distribution = .fillEqually
        stackViewUpper.spacing = 0
        stackViewUpper.alignment = .fill
        
        stackViewLower.axis = .horizontal
        stackViewLower.distribution = .fillEqually
        stackViewLower.spacing = 0
        stackViewLower.alignment = .fill
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
        
        stackViewUpper.snp.makeConstraints(){
            $0.top.equalTo(movieDescription.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        stackViewLower.snp.makeConstraints(){
            $0.top.equalTo(stackViewUpper.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
