//
//  MenuCell.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class MenuCell: BaseCell{
    
    var imageview: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.rgbColor(91, green: 14, blue: 13)
        return iv
    }()
    
    override var highlighted: Bool{
        didSet{
            imageview.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgbColor(91, green: 14, blue: 13)
        }
    }
    
    
    override var selected: Bool{
        didSet{
            imageview.tintColor = selected ? UIColor.whiteColor() : UIColor.rgbColor(91, green: 14, blue: 13)
        }
    }
    
    override func setUpViews() {
        super.setUpViews()
        self.addSubview(imageview)
        
        addConstraintsWithFormats("H:[v0(28)]", views: imageview)
        addConstraintsWithFormats("V:[v0(28)]", views: imageview)
        
        addConstraint(NSLayoutConstraint(item: imageview, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageview, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
}
