//
//  TableViewCell.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 08/02/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = TableViewCell.newTitleLabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        titleLabel.frame.origin = CGPoint(x: 0, y: 0)
    }
    
    /**
     Configure the table view's cell
     */
    func configure(title: String?) {
        titleLabel.text = title
    }
    
    /**
     Create and configure a new title label
     */
    private static func newTitleLabel() -> UILabel {
        let titleLabel: UILabel = UILabel()
        
        return titleLabel
    }
}
