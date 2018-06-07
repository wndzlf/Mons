//
//  BannerViewController.swift
//  Mons
//
//  Created by Jiyong Park on 23/05/2018.
//  Copyright © 2018 jungwon.sy. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var bannerPageControl2: UIPageControl!
    @IBOutlet weak var scrollView3: UIScrollView!
    @IBOutlet weak var bannerPageControl3: UIPageControl!
    
    var bannerImages1:[String] = ["icon_banner1", "icon_banner2", "icon_banner3"]
    var bannerImages2:[String] = ["icon_banner4", "icon_banner5", "icon_banner6"]
    var bannerImages3:[String] = ["icon_banner7", "icon_banner8", "icon_banner9"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        makeBannerView(scrollView: scrollView, pageControl: bannerPageControl, images: bannerImages1)
        makeBannerView(scrollView: scrollView2, pageControl: bannerPageControl2, images: bannerImages2)
        makeBannerView(scrollView: scrollView3, pageControl: bannerPageControl3, images: bannerImages3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///// 배너 이미지 컨트롤 관련
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        bannerPageControl.currentPage = Int(pageNumber)
    }
    
    func makeBannerView(scrollView: UIScrollView, pageControl: UIPageControl, images: [String])
    {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        pageControl.layer.zPosition = .greatestFiniteMagnitude
        pageControl.numberOfPages = images.count
        for i in 0 ... images.count-1 {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[i])
            imageView.isOpaque = true
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(bannerImages1.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
