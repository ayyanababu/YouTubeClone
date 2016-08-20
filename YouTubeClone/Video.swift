//
//  Video.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 20/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import Foundation
import UIKit

class Video: NSObject{
    
    var thumbnailImage: String?
    var title: String?
    var numberofViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
}


class Channel: NSObject{
    var chanelname: String?
    var profileImage: String?
    
}