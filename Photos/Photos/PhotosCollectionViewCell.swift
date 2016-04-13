//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Jeffrey Liu on 4/9/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//


import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var photo: Photo!
    var heartTapped : Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: self.contentView.bounds)
        self.contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}