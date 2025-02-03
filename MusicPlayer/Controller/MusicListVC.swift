//
//  MusicListVC.swift
//  MusicPlayer
//
//  Created by Aditya on 03/02/25.
//

import UIKit

class MusicListVC: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var tabholderview: UIView!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let musicArray: [MusicDetail] = [
        MusicDetail(musicname: "Sunset Chill", categoryame: "Lo-Fi", xpPoints: "130", countSongs: "12", duration: "40 min", image: "image5"),
        MusicDetail(musicname: "Metal Mayhem", categoryame: "Metal", xpPoints: "220", countSongs: "22", duration: "1 hr 10 min", image: "image4"),
        MusicDetail(musicname: "RnB Grooves", categoryame: "RnB", xpPoints: "190", countSongs: "17", duration: "48 min", image: "image3"),
        MusicDetail(musicname: "Piano Dreams", categoryame: "Instrumental", xpPoints: "260", countSongs: "30", duration: "1 hr 40 min", image: "image2"),
        MusicDetail(musicname: "Blues Revival", categoryame: "Blues", xpPoints: "175", countSongs: "16", duration: "50 min", image: "image1")
    ]
    var selectedFavorites: Set<Int> = []
    private var lastContentOffset: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ListCVC", bundle: .main), forCellWithReuseIdentifier: "ListCVC")
        print("the code is running in main branch")
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

extension MusicListVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCVC", for: indexPath) as! ListCVC
        cell.layer.cornerRadius = 10
        cell.musicname.text = musicArray[indexPath.item].musicname
        cell.durationXPlbl.text = "\(musicArray[indexPath.item].duration ?? "") ● \(musicArray[indexPath.item].xpPoints ?? "")XP"
        cell.imageview.image = UIImage(named: "\(musicArray[indexPath.row].image ?? "")")
        cell.favouritebtn.isSelected = selectedFavorites.contains(indexPath.item)

                
                cell.favoriteButtonAction = { [weak self] in
                    guard let self = self else { return }
                    if self.selectedFavorites.contains(indexPath.item) {
                        self.selectedFavorites.remove(indexPath.item)
                    } else {
                        self.selectedFavorites.insert(indexPath.item)
                    }
                }

                
                cell.playButtonAction = { [weak self] in
                    guard let self = self else { return }
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
                    vc.selectedMusic = self.musicArray[indexPath.item]
                    self.navigationController?.pushViewController(vc, animated: true)
                }
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
