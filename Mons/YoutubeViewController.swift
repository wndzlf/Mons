import UIKit
import YouTubePlayer
class YoutubeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    var category = ""
    var categoryIndex = 0
    let videoArray = myDatas.videoArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = videoArray[categoryIndex].count
        return count
    }
    
    //cell설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? VideoCell
        //ULRDataSource 로부터 indexpath.row에 해당하는 url을 얻어온다.
        let url = videoArray[categoryIndex][indexPath.row]
        cell?.setupVideoView(url: url)
        return cell!
    }
    
    //sizeForItemAt ---> 너비와 높이 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

//특정한 셀의 형태를 지정한다. 셀안에 있는 뷰와 라인을 지정한다.
class VideoCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSeparatorViews()
    }
    
    //VideoView를 다시 정의 한다.
    func setupVideoView(url:String) {
        //객체를 생성하고
        let playerView = YouTubePlayerView()
        let myVideoURL = NSURL(string: url)
        //객체의 특성을 정의한다
        playerView.playerVars = ["playsinline": 1 as AnyObject,
                                 "showinfo": 1 as AnyObject,
                                 "controls" : 1 as AnyObject]
        playerView.loadVideoURL(myVideoURL! as URL)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        //Cell에서 Subview로 playerView를 넣는다.
        addSubview(playerView)
        //오토레이아웃 부분.
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":playerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":playerView]))
    }
    
    //viewdidload
    let videoView: YouTubePlayerView = {
        let playerView = YouTubePlayerView()
        // let urldatasource = DataSource()
        //let url = urldatasource.videoArray[number]
        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=9WhpAVOSyl8")
        
        playerView.playerVars = ["playsinline": 1 as AnyObject,
                                 "showinfo": 1 as AnyObject,
                                 "controls" : 1 as AnyObject]
        playerView.loadVideoURL(myVideoURL! as URL)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        return playerView
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.brown
        imageView.translatesAutoresizingMaskIntoConstraints  = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupSeparatorViews(){
        addSubview(separatorView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}


