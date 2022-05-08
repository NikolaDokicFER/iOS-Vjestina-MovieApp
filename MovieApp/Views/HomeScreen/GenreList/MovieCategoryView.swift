//
//  MovieCategoryView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 13.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieCategoryView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private var categoryTitle: UILabel!
    private var categoryTitleText: String!
    private var genres: GenreList!
    private var genreCollectionView: UICollectionView!
    private var genreCollectionLayout: UICollectionViewFlowLayout!
    
    init(categoryTitleText: String, genres: GenreList){
        super.init(frame: CGRect.zero)
        
        self.categoryTitleText = categoryTitleText
        self.genres = genres
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        categoryTitle = UILabel()
        categoryTitle.text = categoryTitleText
        self.addSubview(categoryTitle)
        
        genreCollectionLayout = UICollectionViewFlowLayout()
        
        genreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: genreCollectionLayout)
        genreCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.id)
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        self.addSubview(genreCollectionView)
    }
    
    private func styleViews(){
        categoryTitle.textColor = UIColor(red: 0.043, green: 0.145, blue: 0.247, alpha: 1)
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 22)
        
        genreCollectionLayout.scrollDirection = .horizontal

        genreCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func constraintViews(){
        categoryTitle.snp.makeConstraints(){
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(genreCollectionView.snp.top)
        }

        genreCollectionView.snp.makeConstraints(){
            $0.top.equalTo(categoryTitle.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.id, for: indexPath) as! GenreCollectionViewCell

        cell.configureGenre(genreName: genres.genres[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: genres.genres[indexPath.item].name.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 30)
    }
}
