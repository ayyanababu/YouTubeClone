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

