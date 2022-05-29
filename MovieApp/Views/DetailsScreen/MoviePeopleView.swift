//
//  MoviePeopleView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 11.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MoviePeopleView: UIView{
    
    private var personName: UILabel!
    private var personRole: UILabel!
    
    init(personString: String, roleString: String){
        super.init(frame: CGRect.zero)
        
        buildViews()
        styleViews(personString: personString, roleString: roleString)
        constraintViews()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews(){
        personName = UILabel()
        self.addSubview(personName)
        
        personRole = UILabel()
        self.addSubview(personRole)
    }
    
    private func styleViews(personString: String, roleString: String){
        personName.font = UIFont.boldSystemFont(ofSize: 16)
        personName.text = personString
        personName.textColor = .black
        
        personRole.text = roleString
        personRole.textColor = .black
    }
    
    private func constraintViews(){
        personName.snp.makeConstraints(){
            $0.top.leading.trailing.equalToSuperview()
        }
        
        personRole.snp.makeConstraints(){
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(personName.snp.top).offset(20)
        }
    }
}
