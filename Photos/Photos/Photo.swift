//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo: NSObject, NSCoding {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* The date of the photo */
    var date : NSDate!
    /* Keeps track of whether the photo has been liked */
    var heartTapped : Bool!
    /* Unique key for the photo in NSUserDefaults */
    var uuid : NSUUID

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        url = data.valueForKey("images")?.valueForKey("standard_resolution")?.valueForKey("url") as! String
        username = data.valueForKey("user")?.valueForKey("username") as! String
        date = NSDate(timeIntervalSince1970: Double(data.valueForKey("created_time") as! String)!)
        heartTapped = false
        uuid = NSUUID()
        
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
    }
    
    init(likes : Int, url : String, username: String, date : NSDate, heartTapped: Bool, uuid: NSUUID) {
        
        self.likes = likes
        self.url = url
        self.username = username
        self.date = date
        self.heartTapped = heartTapped
        self.uuid = uuid
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let likes = aDecoder.decodeIntegerForKey("likes")
        let url = aDecoder.decodeObjectForKey("url") as! String
        let username = aDecoder.decodeObjectForKey("username") as! String
        let date = aDecoder.decodeObjectForKey("date") as! NSDate
        let heartTapped = aDecoder.decodeObjectForKey("heartTapped") as! Bool
        let uuid = aDecoder.decodeObjectForKey("uuid") as! NSUUID
    
        self.init(likes: likes, url: url, username: username, date: date, heartTapped: heartTapped, uuid: uuid)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(likes, forKey: "id")
        aCoder.encodeObject(url, forKey: "url")
        aCoder.encodeObject(username, forKey: "username")
        aCoder.encodeObject(date, forKey: "date")
        aCoder.encodeObject(heartTapped, forKey: "heartTapped")
        aCoder.encodeObject(uuid, forKey: "uuid")
    }

}