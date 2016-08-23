//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

extension UIColor{
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UIView{
    
    
    func addConstraintsWithFormats(format: String, views: UIView...){
        
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerate(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}


let imageCache = NSCache()

class CustomImageView: UIImageView{
    
    var imageUrlString: String?
    func loadImageFromURL(urlString: String){
        
        imageUrlString = urlString
        
        if let imagefromcache = imageCache.objectForKey(urlString){
            self.image = imagefromcache as? UIImage
            return
        }
    
        let url = NSURL(string: urlString)
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                let imageToCache = UIImage(data: data!)
                
                if self.imageUrlString == urlString{
                    self.image = UIImage(data: data!)

                }
                
                imageCache.setObject(imageToCache!, forKey: urlString)
                
            })
            
        }).resume()
    }
}

