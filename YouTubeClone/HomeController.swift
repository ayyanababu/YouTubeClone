//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 18/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = {
        
        var kaneyChannel = Channel()
        kaneyChannel.chanelname = "KaneyIsTheBestChannel"
        kaneyChannel.profileImage = "kanye_profile"
        
        var blankspacevideo = Video()
        blankspacevideo.thumbnailImage = "taylor_swift_blank_space"
        blankspacevideo.title = "Taylor Swift Blank Song"
        blankspacevideo.channel = kaneyChannel
        blankspacevideo.numberofViews = 24356
        
        var badbloodvideo = Video()
        badbloodvideo.thumbnailImage = "taylor_swift_bad_blood"
        badbloodvideo.title = "Taylor Swift -Bad Blood Featuring kandrik"
        badbloodvideo.channel = kaneyChannel
        badbloodvideo.numberofViews = 5432189
        
        
        return [blankspacevideo,badbloodvideo]
    }()
    
    let menubar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, self.view.frame.size.width - 32, view.frame.size.height)
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = .Center
        navigationItem.titleView = titleLabel
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        self.setupMenuBar()
        self.setUpNavBarIcons()
    }
    
    private func setupMenuBar(){
        self.view.addSubview(menubar)
        self.view.addConstraintsWithFormats("H:|[v0]|", views: menubar)
        self.view.addConstraintsWithFormats("V:|[v0(50)]", views: menubar)
    }
    
    private func setUpNavBarIcons(){
        let searchImage = UIImage(named: "search_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let searchBarButton = UIBarButtonItem(image: searchImage, style: .Plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "nav_more_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .Plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
    }
    
    func handleSearch(){
        print("clicked on search")
    }
    
    
    func handleMore(){
        print("clicked on More Button")
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath) as? VideoCell
        cell?.video = videos[indexPath.item]
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = (self.view.frame.size.width - 16 - 16 ) * (9 / 16)
        return CGSizeMake(self.view.frame.width, height + 16 + 88)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}





