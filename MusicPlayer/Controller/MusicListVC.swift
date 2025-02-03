//
//  MusicListVC.swift
//  MusicPlayer
//
//  Created by manas dutta on 03/02/25.
//

import UIKit

class MusicListVC: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var tabholderview: UIView!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var lastContentOffset: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ListCVC", bundle: .main), forCellWithReuseIdentifier: "ListCVC")
        
    }
    

    

}

extension MusicListVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCVC", for: indexPath) as! ListCVC
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
}

extension MusicListVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 00, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width-30))
        let height = ((collectionView.frame.height-40)/8)
        return CGSize(width: width, height: height)
    }
}

extension MusicListVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if yOffset > lastContentOffset {
            // Scrolling Down
            UIView.animate(withDuration: 0.3) {
                self.imageview.alpha = 0
                self.tabholderview.backgroundColor = UIColor.black
            }
        } else if yOffset < lastContentOffset {
            // Scrolling Up
            UIView.animate(withDuration: 0.3) {
                self.imageview.alpha = 1
                self.tabholderview.backgroundColor = UIColor.clear
            }
        }
        
        lastContentOffset = yOffset
    }
}
