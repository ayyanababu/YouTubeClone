//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 18/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    /*var videos: [Video] = {
        
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
    }()*/
    
    var videos: [Video]?
    
    let menubar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchVideos()
        
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, self.view.frame.size.width - 32, view.frame.size.height)
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        navigationItem.titleView = titleLabel
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        self.setupMenuBar()
        self.setUpNavBarIcons()
    }
    
    func fetchVideos(){
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if error != nil{
                print(error?.description)
                return
            }
            
            do{
                let jsondata = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                print(jsondata)
                
                self.videos = [Video]()
                
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
                    
                    self.videos?.append(video)
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), { 
                    self.collectionView?.reloadData()
                })
                //self.collectionView?.reloadData()
                
            }catch let jsonError{
                print(jsonError)
            }
            
            //let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(str)
            
        }.resume()
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
        return videos?.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath) as? VideoCell
        cell?.video = videos![indexPath.item]
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(view.frame.width, height + 16 + 88)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}





