//
//  PageCell.swift
//  KindleLBTA
//
//  Created by Aayush Bajracharya on 5/9/18.
//  Copyright © 2018 Aayush Bajracharya. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(textLabel)
//        textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
