//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Jeffrey Liu on 4/10/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var image : UIImage!
    var username : String!
    var date : String!
    var likes : String!
    var heartTapped : Bool!
    var photo : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        usernameLabel.text = username
        dateLabel.text = date
        likesLabel.text = likes + " likes"
        self.view.backgroundColor = UIColor.lightGrayColor()
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        
        if (heartTapped!) {
            heartButton.setTitle("💙", forState: UIControlState.Normal)
        }
        else {
            heartButton.setTitle("💛", forState: UIControlState.Normal)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func heartTapped(sender: AnyObject) {
        photo.heartTapped = true
        heartButton.setTitle("💙", forState: UIControlState.Normal)
        saveData(photo)
    }
    
    func saveData(photo : Photo) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let encodedData = NSKeyedArchiver.archivedDataWithRootObject(photo)
        defaults.setObject(encodedData, forKey: "\(photo.uuid.UUIDString)")
        defaults.synchronize()
    }
    


}
