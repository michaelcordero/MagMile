//
//  NewsCell.swift
//  magmile
//
//  Created by Michael Cordero on 10/28/17.
//  Copyright © 2017 Codec Software. All rights reserved.
//

import Foundation

class NewsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
    }
}
