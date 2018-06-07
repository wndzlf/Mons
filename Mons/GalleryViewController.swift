//
//  GalleryViewController.swift
//  Mons
//
//  Created by Jiyong Park on 26/05/2018.
//  Copyright © 2018 jungwon.sy. All rights reserved.
//

import UIKit
import Photos

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var myCollectionView: UICollectionView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "갤러리"
        let logo = UIImage(named: "icon_logo")
        self.navigationController?.navigationBar.setBackgroundImage(logo, for: .default)
        
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(PhotoItemCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
        
        myCollectionView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        imageArray = myDatas.photoArray as! [UIImage]
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoItemCell
        cell.img.image = imageArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImagePreviewViewController()
        vc.imgArray = self.imageArray
        vc.passedContentOffset = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        if DeviceInfo.Orientation.isPortrait
        {
            return CGSize(width: width/4 - 1, height: width/4 - 1)
        }
        else
        {
            return CGSize(width: width/6 - 1, height: width/6 - 1)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func grabPhotos()
    {
        imageArray = []
        
        DispatchQueue.global(qos: .background).async {
            print("Background queue에서 동작")
            let imgManager = PHImageManager.default()
            
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .highQualityFormat    // 고화질
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors=[NSSortDescriptor(key: "creationDate", ascending: false)]
            
            let fetchResult:PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            print(fetchResult)
            print(fetchResult.count, "개 이미지 fetch 완료")
            
            if fetchResult.count > 0
            {
                for i in 0..<fetchResult.count
                {
                    imgManager.requestImage(for: fetchResult.object(at: i) as PHAsset, targetSize: CGSize(width: 500, height: 500), contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, error) in
                        self.imageArray.append(image!)
                    })
                }
            }
            else
            {
                print("사진이 없습니다.")
            }
            print("이미지 개수 : \(self.imageArray.count)")
            
            DispatchQueue.main.async {
                print("main queue에서 동작 중")
                self.myCollectionView.reloadData()
            }
        }
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

class PhotoItemCell: UICollectionViewCell
{
    var img = UIImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        self.addSubview(img)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

struct DeviceInfo {
    struct Orientation {
        static var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation ? UIDevice.current.orientation.isLandscape : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
        
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation ? UIDevice.current.orientation.isPortrait : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }
}
