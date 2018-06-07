//
//  DataSource.swift
//  Mons
//
//  Created by admin on 2018. 5. 28..
//  Copyright © 2018년 jungwon.sy. All rights reserved.
//

import UIKit
import Foundation

class DataSource{
    let videoCategoryArray = ["국가대표", "다이어트", "스포츠", "헬스", "식이요법"]
    
    let representativeVideoArray:[String] = ["https://www.youtube.com/watch?v=9WhpAVOSyl8","https://www.youtube.com/watch?v=FsqhUFcjL8k",
                                             "https://www.youtube.com/watch?v=yOHKujUxe7Q","https://www.youtube.com/watch?v=cXOwm_v3EpQ",
                                             "https://www.youtube.com/watch?v=8tW17Szsb90","https://www.youtube.com/watch?v=QA5jS0dPa6w"]
    let dietVideoArray:[String] = ["https://www.youtube.com/watch?v=CPEFTLyFlfA","https://www.youtube.com/watch?v=WO8QQsryr50",
                                   "https://www.youtube.com/watch?v=EFadnuaH-Jg","https://www.youtube.com/watch?v=oliKOMn4PAE",
                                   "https://www.youtube.com/watch?v=I4prDX-Z-Ho"]
    let sportsVideoArray:[String] = ["https://www.youtube.com/watch?v=dJlFmxiL11s",
                                     "https://www.youtube.com/watch?v=u4Dgds5Sb8g",
                                     "https://www.youtube.com/watch?v=TZTnkclzkuM"]
    let healthVideoArray:[String] = ["https://www.youtube.com/watch?v=C3TqpGgnIoI",
                                     "https://www.youtube.com/watch?v=2LyDkE7sDec",
                                     "https://www.youtube.com/watch?v=3TU81R9D1ao"]
    let foodVideoArray:[String] = ["https://www.youtube.com/watch?v=u4Dgds5Sb8g",
                                   "https://www.youtube.com/watch?v=WO8QQsryr50",
                                   "https://www.youtube.com/watch?v=xNYJud41I_c"]
    let videoArray:[[String]]

    let photoArray = [UIImage(named: "gallery1"), UIImage(named: "gallery2"), UIImage(named: "gallery3"), UIImage(named: "gallery4"), UIImage(named: "gallery5"), UIImage(named: "gallery6"), UIImage(named: "gallery7"), UIImage(named: "gallery8"), UIImage(named: "gallery9"), UIImage(named: "gallery10")]
    
    let boardCategoryArray = ["다이어트", "헬스", "식단 관리", "스포츠", "다이어트 자극"]
    let dietBoardArray:[boardContent] = [boardContent(writer: "pjy0121", content: "여러분 안녕하세요~~"), boardContent(writer: "pjy0121", content: "1빠~~~~")]
    let healthBoardArray:[boardContent] = [boardContent(writer: "pjy0121", content: "여러분 안녕하세요~~"), boardContent(writer: "pjy0121", content: "여기는 헬스 게시판")]
    let foodBoardArray:[boardContent] = [boardContent(writer: "pjy0121", content: "여러분 안녕하세요~~"), boardContent(writer: "pjy0121", content: "여기는 식단 관리 게시판")]
    let sportsBoardArray:[boardContent] = [boardContent(writer: "pjy0121", content: "여러분 안녕하세요~~"), boardContent(writer: "pjy0121", content: "여기는 스포츠 게시판")]
    let dietpushBoardArray:[boardContent] = [boardContent(writer: "pjy0121", content: "여러분 안녕하세요~~"), boardContent(writer: "pjy0121", content: "여기는 다이어트 자극 글이나 사진을 올려주세요.")]
    let boardArray:[[boardContent]]
    
    init() {
        self.videoArray = [representativeVideoArray, dietVideoArray, sportsVideoArray, healthVideoArray, foodVideoArray]
        self.boardArray = [dietBoardArray, healthBoardArray, foodBoardArray, sportsBoardArray, dietpushBoardArray]
    }
}

class boardContent {
    var writer:String = ""
    var content:String = ""
    var time:[NSDate]? = nil
    
    init(writer:String, content:String)
    {
        self.writer = writer
        self.content = content
    }
}

let myDatas = DataSource()
