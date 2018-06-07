//
//  TabScrollViewController.swift
//  Mons
//
//  Created by Jiyong Park on 29/05/2018.
//  Copyright © 2018 jungwon.sy. All rights reserved.
//

import UIKit
import ACTabScrollView

class BoardTabScrollViewController: UIViewController, ACTabScrollViewDelegate, ACTabScrollViewDataSource {
    
    let categories = myDatas.boardCategoryArray
    	
    @IBOutlet weak var tabScrollView: ACTabScrollView!
    var contentViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        for i in 0 ..< categories.count {
            let vc = storyboard.instantiateViewController(withIdentifier: "BoardTableViewController") as! BoardTableViewController
            vc.category = categories[i]
            vc.categoryIndex = i
            
            addChildViewController(vc) // don't forget, it's very important
            contentViews.append(vc.view)
        }
        
        tabScrollView.defaultPage = 0
        tabScrollView.arrowIndicator = true
        tabScrollView.tabSectionHeight = 120
        tabScrollView.tabSectionBackgroundColor = UIColor.white
        tabScrollView.contentSectionBackgroundColor = UIColor.gray
        tabScrollView.tabGradient = true
        tabScrollView.pagingEnabled = true
        tabScrollView.cachedPageLimit = 3
        
        tabScrollView.dataSource = self
        tabScrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        print(index)
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        print("i", index)
    }
    
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return categories.count
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        // create a label
        let label = UILabel()
        label.text = categories[index] /* tab title at {index} */
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(
            width: label.frame.size.width + 28,
            height: label.frame.size.height + 15) // add some paddings
        
        return label
        
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return contentViews[index]
    }
}

