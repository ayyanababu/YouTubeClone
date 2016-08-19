//
//  BaseCell.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
    }
    
    func setUpViews(){
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
