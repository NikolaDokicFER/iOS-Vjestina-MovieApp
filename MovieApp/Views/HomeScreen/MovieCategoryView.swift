//
//  MovieCategoryView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 13.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieCategoryView: UIView{
    
    private var categoryTitle: UILabel!
    private var categorySelectButton1: UIButton!
    private var categorySelectButton2: UIButton!
    private var categorySelectButton3: UIButton!
    private var categorySelectButton4: UIButton!
    private var underlineImage: UIImageView!
    private var buttonPressed = 1
    
    init(categoryTitleText: String, buttonText1: String, buttonText2: String, buttonText3: String, buttonText4: String){
        super.init(frame: CGRect.zero)
        
        buildViews(categoryTitleText: categoryTitleText, buttonText1: buttonText1, buttonText2: buttonText2, buttonText3: buttonText3, buttonText4: buttonText4)
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(categoryTitleText: String, buttonText1: String, buttonText2: String, buttonText3: String, buttonText4: String){
        categoryTitle = UILabel()
        categoryTitle.text = categoryTitleText
        self.addSubview(categoryTitle)
        
        if(buttonText1 != ""){
            categorySelectButton1 = UIButton()
            categorySelectButton1.setTitle(buttonText1, for: .normal)
            categorySelectButton1.setTitleColor(.black, for: .normal)
            categorySelectButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            categorySelectButton1.tag = 1
            categorySelectButton1.addTarget(self, action: #selector(categoryChanged), for: .touchUpInside)
            self.addSubview(categorySelectButton1)
        }
        
        if(buttonText2 != ""){
            categorySelectButton2 = UIButton()
            categorySelectButton2.setTitle(buttonText2, for: .normal)
            categorySelectButton2.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton2.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            categorySelectButton2.tag = 2
            categorySelectButton2.addTarget(self, action: #selector(categoryChanged), for: .touchUpInside)
            self.addSubview(categorySelectButton2)
        }
            
        if(buttonText3 != ""){
            categorySelectButton3 = UIButton()
            categorySelectButton3.setTitle(buttonText3, for: .normal)
            categorySelectButton3.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton3.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            categorySelectButton3.tag = 3
            categorySelectButton3.addTarget(self, action: #selector(categoryChanged), for: .touchUpInside)
            self.addSubview(categorySelectButton3)
        }
        if(buttonText4 != ""){
            categorySelectButton4 = UIButton()
            categorySelectButton4.setTitle(buttonText4, for: .normal)
            categorySelectButton4.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton4.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            categorySelectButton4.tag = 4
            categorySelectButton4.addTarget(self, action: #selector(categoryChanged), for: .touchUpInside)
            self.addSubview(categorySelectButton4)
        }
        
        underlineImage = UIImageView(image: UIImage(systemName: "minus"))
        self.addSubview(underlineImage)
    }
    
    private func styleViews(){
        categoryTitle.textColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 22)
        
        underlineImage.tintColor = .black
    }
    
    private func constraintViews(){
        categoryTitle.snp.makeConstraints(){
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(categorySelectButton1.snp.top)
        }
        
        if categorySelectButton1 != nil {
            categorySelectButton1.snp.makeConstraints(){
                $0.leading.bottom.equalToSuperview()
            }
        }
        
        if categorySelectButton2 != nil {
            categorySelectButton2.snp.makeConstraints(){
                $0.bottom.equalToSuperview()
                $0.leading.equalTo(categorySelectButton1.snp.trailing).offset(20)
            }
        }
        
        if categorySelectButton3 != nil {
            categorySelectButton3.snp.makeConstraints(){
                $0.bottom.equalToSuperview()
                $0.leading.equalTo(categorySelectButton2.snp.trailing).offset(20)
            }
        }
        
        if categorySelectButton4 != nil {
            categorySelectButton4.snp.makeConstraints(){
                $0.bottom.equalToSuperview()
                $0.leading.equalTo(categorySelectButton3.snp.trailing).offset(20)
            }
        }
        
        underlineImage.snp.makeConstraints(){
            $0.top.equalTo(categorySelectButton1.snp.bottom)
            $0.leading.trailing.equalTo(categorySelectButton1)
            $0.height.equalTo(3)
        }
    }
    
    @objc func categoryChanged(sender: UIButton){
        switch sender.tag{
            case 1:
            underlineImage.snp.remakeConstraints(){
                $0.top.equalTo(categorySelectButton1.snp.bottom)
                $0.leading.trailing.equalTo(categorySelectButton1)
                $0.height.equalTo(3)
            }
            changeButtonColors(sender: sender)
            case 2:
            underlineImage.snp.remakeConstraints(){
                $0.top.equalTo(categorySelectButton2.snp.bottom)
                $0.leading.trailing.equalTo(categorySelectButton2)
                $0.height.equalTo(3)
            }
            changeButtonColors(sender: sender)
            case 3:
            underlineImage.snp.remakeConstraints(){
                $0.top.equalTo(categorySelectButton3.snp.bottom)
                $0.leading.trailing.equalTo(categorySelectButton3)
                $0.height.equalTo(3)
            }
            changeButtonColors(sender: sender)
            case 4:
            underlineImage.snp.remakeConstraints(){
                $0.top.equalTo(categorySelectButton4.snp.bottom)
                $0.leading.trailing.equalTo(categorySelectButton4)
                $0.height.equalTo(3)
            }
            changeButtonColors(sender: sender)
            default:
            underlineImage.snp.remakeConstraints(){
                $0.top.equalTo(categorySelectButton1.snp.bottom)
                $0.leading.trailing.equalTo(categorySelectButton1)
            }
            changeButtonColors(sender: sender)
        }
    }
    
    private func changeButtonColors(sender: UIButton){
        switch buttonPressed {
            case 1:
            categorySelectButton1.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton1.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            case 2:
            categorySelectButton2.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton2.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            case 3:
            categorySelectButton3.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton3.titleLabel?.font = UIFont.systemFont(ofSize: 16)

            case 4:
            categorySelectButton4.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton4.titleLabel?.font = UIFont.systemFont(ofSize: 16)

        default:
            categorySelectButton1.setTitleColor(UIColor(red: 0.510, green: 0.510, blue: 0.510, alpha: 1), for: .normal)
            categorySelectButton1.titleLabel?.font = UIFont.systemFont(ofSize: 16)

        }
        
        sender.setTitleColor(.black, for: .normal)
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        buttonPressed = sender.tag
    }
}
