//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView!.registerClass(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        self.collectionView?.backgroundColor = UIColor.lightGrayColor()
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotosCollectionViewCell", forIndexPath: indexPath) as! PhotosCollectionViewCell
        // Configure the cell
        
        if photos != nil{
            let photo = photos[indexPath.item]
            loadImageForCell(photo, imageView: cell.imageView)
            cell.photo = photo
            return cell
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        let cell : UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
        performSegueWithIdentifier("ShowDetailSegue", sender: cell)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos == nil {
            return 0
        }
        return photos.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetailSegue" {
            if let destination = segue.destinationViewController as? PhotoDetailViewController {
                if let cell = sender as? PhotosCollectionViewCell {
                    destination.photo = cell.photo
                    destination.image = cell.imageView.image
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
                    dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
                    destination.date = "\(dateFormatter.stringFromDate(cell.photo.date))"
                    destination.likes = String(cell.photo.likes)
                    destination.username = cell.photo.username
                    destination.heartTapped = heartTapped(cell.photo)
                }
            }
        }
    }
    
    func heartTapped(photo : Photo) -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()        
        if let decoded = defaults.objectForKey("\(photo.uuid.UUIDString)") as! NSData? {
            
            let decodedPhoto = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! Photo
            
            return decodedPhoto.heartTapped
        }
        return false
    }
    

    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url =  NSURL(string: photo.url)!
        let data = NSData(contentsOfURL: url)!
        let img = UIImage(data: data)!
        imageView.image = img
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

