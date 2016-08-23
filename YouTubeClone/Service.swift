//
//  Service.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 23/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import Foundation
import UIKit

class Service: NSObject{
    static let sharedInstacne = Service()
    
    func fetchVideos(completionHandler: ([Video]) -> ()){
        
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if error != nil{
                print(error?.description)
                return
            }
            
            do{
                let jsondata = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                print(jsondata)
                
                var videos = [Video]()
                
                for dict in jsondata as! [[String: AnyObject]]{
                    // print(dict)
                    let video = Video()
                    
                    video.title = dict["title"] as? String
                    video.thumbnailImage = dict["thumbnail_image_name"] as? String
                    
                    let channeldict = dict["channel"] as? [String: AnyObject]
                    let channel = Channel()
                    channel.chanelname =  channeldict!["name"] as? String
                    channel.profileImage = channeldict!["profile_image_name"] as? String
                    video.channel = channel
                    
                    videos.append(video)
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(videos)
                })
                
            }catch let jsonError{
                print(jsonError)
            }
            
            //let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(str)
            
            }.resume()

    
    }
}