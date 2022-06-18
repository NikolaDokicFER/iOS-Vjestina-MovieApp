//
//  HomeScreenMoviesView.swift
//  MovieApp
//
//  Created by Nikola Đokić on 12.04.2022..
//

import Foundation
import UIKit
import SnapKit

class HomeScreenMoviesView: UIView, UITableViewDataSource, UITableViewDelegate, SelectedMovieDelegate{
    
    private var homeTableView: UITableView!
    private var groupList = ["popular", "trending", "topRated", "recommended"]
    public var selectedMovieDelegate: SelectedMovieDelegate!
    
    override init(frame: CGRect){
        super.init(frame: frame)

        buildViews()
        constraintViews()
    }
    
    required init?(coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func buildViews(){
        homeTableView = UITableView()
        self.addSubview(homeTableView)
        
        homeTableView.register(HomeScreenTableViewCell.self, forCellReuseIdentifier: HomeScreenTableViewCell.id)
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        homeTableView.separatorStyle = .none
        homeTableView.showsVerticalScrollIndicator = false
    }
    
    private func constraintViews(){
        homeTableView.snp.makeConstraints(){
            $0.edges.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeScreenTableViewCell.id, for: indexPath) as! HomeScreenTableViewCell

        cell.configureMovieGroup(group: groupList[indexPath.row])
        cell.selectedMovieDelegate = self
        return cell
    }
    
    func selectedMovieId(movieId: Int) {
        selectedMovieDelegate.selectedMovieId(movieId: movieId)
    }
}
