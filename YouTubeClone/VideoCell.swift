//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class VideoCell: BaseCell{
    
    var video: Video?{
        didSet{
            self.titleLabel.text = video!.title
            self.thumnailImageView.image = UIImage(named: video!.thumbnailImage!)
            
            if let profileImage = video?.channel?.profileImage{
                self.userProfileImageView.image = UIImage(named:profileImage)
            }
            
            if let subtitle = video?.channel?.chanelname{
                
                if let numbeofview = video?.numberofViews{
                    let numberformatter = NSNumberFormatter()
                    numberformatter.numberStyle = .DecimalStyle
                    
                    let subtitletext = "\(subtitle) - \(numberformatter.stringFromNumber(numbeofview)!) . 2Years Ago"
                    self.subtitleTextView.text = subtitletext
                }
                
            }
            
            //measure the titlelabel Height
            if let title = video?.title {
                let size = CGSizeMake(frame.width - 16 - 44 - 8 - 16, 1000)
                let options = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRectWithSize(size, options: options, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLableHeightConstraint?.constant = 44
                } else {
                    titleLableHeightConstraint?.constant = 20
                }
            }
            
            
        }
    }
    
    let thumnailImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.blueColor()
        imageview.image = UIImage(named:"taylor_swift_blank_space")
        imageview.contentMode = .ScaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let userProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "taylor_swift_profile")
        
        //rounded image
        imageview.layer.cornerRadius = 22
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift- Blank Space"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.text = "Taylor Swift Blank Song in the US Region is Super Hit - 1,54,345,67 2years"
        textview.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textview.textColor = UIColor.lightGrayColor()
        return textview
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    
    var titleLableHeightConstraint: NSLayoutConstraint?
    
    
    override func setUpViews(){
        super.setUpViews()
        
        self.addSubview(thumnailImageView)
        self.addSubview(seperatorView)
        self.addSubview(userProfileImageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleTextView)
        
        addConstraintsWithFormats("H:|-16-[v0]-16-|", views: thumnailImageView)
        
        addConstraintsWithFormats("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormats("V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumnailImageView, userProfileImageView, seperatorView)
        
        addConstraintsWithFormats("H:|[v0]|", views: seperatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        
        //height constraint
        titleLableHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 44)
        addConstraint(titleLableHeightConstraint!)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 30))
        
    }
    
    
}

