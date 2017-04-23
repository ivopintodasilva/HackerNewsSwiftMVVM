//
//  TableViewCell.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 08/02/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import UIKit
import Cartography

class TableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = TableViewCell.newTitleLabel()
    private lazy var userLabel: UILabel = TableViewCell.newUserLabel()
    private lazy var scoreLabel: UILabel = TableViewCell.newScoreLabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(userLabel)
        contentView.addSubview(scoreLabel)
        
        addConstraints()
        
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Add constraints to the view
     */
    func addConstraints() {
        
        constrain(self, titleLabel, userLabel, scoreLabel) { container, title, user, score in
            
            score.trailing == container.trailing - 10
            score.top == container.top + 5
            
            title.leading == container.leading + 10
            title.trailing == score.leading - 10
            title.top == container.top + 5
            
            user.leading == title.leading
            user.trailing == title.trailing
            user.top == title.bottom + 5
        }
    }
    
    /**
     Configure the views in the cell
     */
    func configureViews() {
        
        backgroundColor = UIColor(red: 246/255, green: 245/255, blue: 240/255, alpha: 255)
        
        let avenirFontTitle = UIFont(name: "AvenirNext-DemiBold", size: 16)
        let avenirFontUser = UIFont(name: "AvenirNext-Regular", size: 16)
        let avenirFontScore = UIFont(name: "AvenirNext-Regular", size: 14)
        
        titleLabel.font = avenirFontTitle
        userLabel.font = avenirFontUser
        scoreLabel.font = avenirFontScore

        titleLabel.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 255)
        titleLabel.textAlignment = .left

        userLabel.textColor = UIColor(red: 163/255, green: 162/255, blue: 161/255, alpha: 255)
        userLabel.textAlignment = .left

        scoreLabel.textColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 255)
        scoreLabel.textAlignment = .right
    }
    
    /**
     Configure the table view's cell
     */
    func configure(title: String?, user: String?, score: String?) {
        titleLabel.text = title
        userLabel.text = user
        scoreLabel.text = score
    }
    
    /**
     Create and configure a new title label
     */
    private static func newTitleLabel() -> UILabel {
        let titleLabel: UILabel = UILabel()
        
        return titleLabel
    }
    
    /**
     Create and configure a new user label
     */
    private static func newUserLabel() -> UILabel {
        let titleLabel: UILabel = UILabel()
        
        return titleLabel
    }
    
    /**
     Create and configure a new score label
     */
    private static func newScoreLabel() -> UILabel {
        let titleLabel: UILabel = UILabel()
        
        return titleLabel
    }
}
