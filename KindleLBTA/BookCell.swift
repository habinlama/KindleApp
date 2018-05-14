//
//  BookCell.swift
//  KindleLBTA
//
//  Created by Aayush Bajracharya on 5/8/18.
//  Copyright © 2018 Aayush Bajracharya. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var book: Book? {
        didSet {
            coverImageView.image =  book?.image
            titlelabel.text = book?.title
            authorlabel.text = book?.author
        }
    }
    
    private let coverImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = #imageLiteral(resourceName: "steve_jobs")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "This the text for the title of our book inside of our cell"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorlabel: UILabel = {
        let label = UILabel()
        label.text = "This is some author for the book that we have in this row"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(coverImageView)
        coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(titlelabel)
        titlelabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        titlelabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titlelabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        addSubview(authorlabel)
        authorlabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 4).isActive = true
        authorlabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        authorlabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
