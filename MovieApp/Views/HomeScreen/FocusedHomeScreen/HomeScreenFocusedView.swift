//
//  HomeScreenFocusedView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 15.04.2022..
//

import Foundation
import UIKit
import MovieAppData
import SnapKit

class HomeScreenFocusedView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var homeCollectionView: UICollectionView!
    private var homeCollectionViewLayout: UICollectionViewFlowLayout!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        styleViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        homeCollectionViewLayout = UICollectionViewFlowLayout()
        
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: homeCollectionViewLayout)
        
        homeCollectionView.register(FocusedHomeCollectionViewCell.self, forCellWithReuseIdentifier: FocusedHomeCollectionViewCell.id)
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        self.addSubview(homeCollectionView)
    }
    
    private func styleViews(){
        homeCollectionViewLayout.scrollDirection = .vertical
        homeCollectionViewLayout.itemSize = CGSize(width: 370, height: 150)
        homeCollectionView.showsVerticalScrollIndicator = false
    }
    
    private func constraintViews(){
        homeCollectionView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieAppData.Movies.all().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FocusedHomeCollectionViewCell.id, for: indexPath) as! FocusedHomeCollectionViewCell
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        cell.configureMovie(movie: MovieAppData.Movies.all()[indexPath.row])
        return cell
    }
    
}
