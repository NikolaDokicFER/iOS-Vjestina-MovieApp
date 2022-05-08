//
//  GenreListView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 08.05.2022..
//

import Foundation
import UIKit

class GenreListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var genreCollectionView: UICollectionView!
    private var genreCollectionLayout: UICollectionViewFlowLayout!
    private var genres: GenreList!
    
    init(genres: GenreList){
        super.init(frame: CGRect.zero)
        self.genres = genres
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        genreCollectionLayout = UICollectionViewFlowLayout()
        
        genreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: genreCollectionLayout)
        genreCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.id)
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        self.addSubview(genreCollectionView)
    }
    
    private func styleViews(){
        genreCollectionLayout.scrollDirection = .horizontal
        genreCollectionLayout.itemSize = CGSize(width: 30, height: 30)
        
        genreCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func constraintViews(){
        genreCollectionView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.id, for: indexPath) as! GenreCollectionViewCell
        print("DADA")
        cell.configureGenre(genreName: genres.genres[indexPath.row].name)
        return cell
    }
}
