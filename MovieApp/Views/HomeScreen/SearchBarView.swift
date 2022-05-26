//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 12.04.2022..
//

import Foundation
import UIKit
import SnapKit

class SearchBarView: UIView, UITextFieldDelegate{
    
    private var containerView: UIView!
    private var magnifierImage: UIImageView!
    private var userInputField: UITextField!
    private var deleteInputButton: UIButton!
    private var cancelInputButton: UIButton!
    private weak var movieController: MovieListViewController!
    
    init(controller: MovieListViewController) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        
        movieController = controller
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder:NSCoder){
        fatalError("Init(coder:) has not been implemented")
    }
    
    private func buildViews(){
        containerView = UIView()
        self.addSubview(containerView)
        
        magnifierImage = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        containerView.addSubview(magnifierImage)
        
        userInputField = UITextField()
        userInputField.delegate = self
        containerView.addSubview(userInputField)
        
        deleteInputButton = UIButton()
        containerView.addSubview(deleteInputButton)
        
        cancelInputButton = UIButton()
        self.addSubview(cancelInputButton)
    }
    
    private func styleViews(){
        containerView.backgroundColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1)
        containerView.layer.cornerRadius = 10
        
        magnifierImage.tintColor = .black
        
        userInputField.textColor = .black
        userInputField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        deleteInputButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteInputButton.tintColor = .black
        deleteInputButton.isHidden = true
        deleteInputButton.addTarget(self, action: #selector(clearInputField), for: .touchUpInside)
        
        cancelInputButton.setTitle("Cancel", for: .normal)
        cancelInputButton.setTitleColor(.black, for: .normal)
        cancelInputButton.isHidden = true
        cancelInputButton.addTarget(self, action: #selector(resetSearchBarView), for: .touchUpInside)
        
    }
    
    private func constraintViews(){
        containerView.snp.makeConstraints(){
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        magnifierImage.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(5)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        
        userInputField.snp.makeConstraints(){
            $0.leading.equalTo(magnifierImage.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
        
        deleteInputButton.snp.makeConstraints(){
            $0.leading.equalTo(userInputField.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.centerY.equalToSuperview()
        }
        
        cancelInputButton.snp.makeConstraints(){
            $0.leading.equalTo(deleteInputButton.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func updateSearchBarView(){
        containerView.snp.updateConstraints(){
            $0.trailing.equalToSuperview().inset(70)
        }
        deleteInputButton.isHidden = false
        cancelInputButton.isHidden = false
    }
    
    @objc func resetSearchBarView(){
        userInputField.resignFirstResponder()
        
        containerView.snp.updateConstraints(){
            $0.trailing.equalToSuperview().inset(18)
        }
        
        deleteInputButton.isHidden = true
        cancelInputButton.isHidden = true
        
        movieController.updateLayout(searchBarActive: false)
    }
    
    @objc func clearInputField(){
        userInputField.text = ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateSearchBarView()
        movieController.updateLayout(searchBarActive: true)
    }
}
