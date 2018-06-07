//
//  MainViewController.swift
//  Mons
//
//  Created by Jiyong Park on 20/05/2018.
//  Copyright © 2018 jungwon.sy. All rights reserved.
//

import UIKit
import YouTubePlayer
import InteractiveSideMenu

class MainViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var tableView : UITableView!
    
    var menuShowing = false
    var bannerImages:[String] = ["icon_banner1", "icon_banner2", "icon_banner3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView = UITableView()
//        menuView.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        tableView.leftAnchor.constraint(equalTo: self.menuView.leftAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: self.menuView.rightAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: self.menuView.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: self.menuView.bottomAnchor).isActive = true
        
//        tableView.dataSource = self
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        
        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=oliKOMn4PAE")
        
        videoView.playerVars = ["playsinline": 1 as AnyObject,
                                "showinfo": 0 as AnyObject,
                                "controls" : 1 as AnyObject]
        videoView.loadVideoURL(myVideoURL! as URL)
        
        let logo = UIImage(named: "icon_logo")
        self.navigationController?.navigationBar.setBackgroundImage(logo, for: .default)
        
        bannerPageControl.numberOfPages = bannerImages.count
        for i in 0 ... bannerImages.count-1 {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: bannerImages[i])
            imageView.isOpaque = true
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(bannerImages.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
        // 동영상 로드
//        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=oliKOMn4PAE")
//        videoView.playerVars = ["playsinline": 1 as AnyObject,
//                                "showinfo": 0 as AnyObject,
//                                "controls" : 0 as AnyObject]
        //videoView.loadVideoURL(myVideoURL! as URL)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///// 동영상 재생 관련
    //이전 파일 재생
    @IBAction func pre(_ sender: UIButton) {
        videoView.previousVideo()
    }
    
    //다음 파일 재생
    @IBAction func next(_ sender: UIButton) {
        videoView.nextVideo()
    }
    
    //재생 버튼
    @IBAction func play(_ sender: UIButton) {
        //선택이 되었으면
        if sender.isSelected{
            //해당버튼을 pause로 바꾼다.
            sender.setImage(UIImage(named: "icon_pause"), for: .normal)
            //멈춤
            videoView.pause()
        }else{
            //아니면 play로 바꾼다.
            sender.setImage(UIImage(named: "icon_play"), for: .normal)
            //시작
            videoView.play()
        }
        //bool값을 돌려준다.
        sender.isSelected = !sender.isSelected
    }
    
    //해당 리스트 id를 가져 온다.
    @IBAction func loadPlayList(_ sender: UIButton) {
        videoView.loadPlaylistID("oliKOMn4PAE")
    }
    ///// 배너 이미지 컨트롤 관련
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        bannerPageControl.currentPage = Int(pageNumber)
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //tableViewDataSource.data.count
//        return data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
//        let text = data[indexPath.row]
//        cell.textLabel?.text = text
//        return cell
//    }
    @IBAction func actionHambuger(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant = -185
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()
            })
        }else{
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
}
