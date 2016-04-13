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

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        self.contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}