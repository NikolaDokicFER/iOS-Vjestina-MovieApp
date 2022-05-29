//
//  GenreCollectionViewCell.swift
//  MovieApp
//
//  Created by Nikola Đokić on 08.05.2022..
//

import Foundation
import UIKit
import SnapKit

class GenreCollectionViewCell: UICollectionViewCell{
    
    static let id = String(describing: GenreCollectionViewCell.self)
    private var genreLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        genreLabel = UILabel()
        self.addSubview(genreLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    public func configureGenre(genreName: String){
        genreLabel.text = genreName
        genreLabel.textColor = .black

        
        genreLabel.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
    }
}
