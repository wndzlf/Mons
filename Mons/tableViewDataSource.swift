//
//  tableViewDataSource.swift
//  Mons
//
//  Created by admin on 2018. 6. 6..
//  Copyright © 2018년 jungwon.sy. All rights reserved.
//

import Foundation

class tableViewDataSource{
    var data:[String] = []
    
    init() {
        for i in 0...1000{
              data.append("\(i)")
        }
    }
}
