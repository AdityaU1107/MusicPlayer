//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Aditya on 02/02/25.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    var categories: [Category] = []
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var toggleview: UIView!
    
    
    @IBOutlet weak var trendingImageview: UIImageView!
    @IBOutlet weak var collectionview1: UICollectionView!
    
    @IBOutlet weak var CollectionViewPageControl: UIPageControl!
    @IBOutlet weak var recommendedImageView: UIImageView!
    @IBOutlet weak var collectionview4: UICollectionView!
    
    @IBOutlet weak var collectionview2: UICollectionView!
    @IBOutlet weak var collectionview3: UICollectionView!
    @IBOutlet weak var holderview1: UIView!
    
    
    @IBOutlet weak var searchHolderView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableview1: UITableView!
    
    let musicArray: [MusicDetail] = [
        MusicDetail(musicname: "Chill Vibes", categoryame: "Lo-Fi", xpPoints: "120", countSongs: "15", duration: "45 min", image: "image1"),
        MusicDetail(musicname: "Rock Legends", categoryame: "Rock", xpPoints: "200", countSongs: "20", duration: "1 hr", image: "image2"),
        MusicDetail(musicname: "Hip-Hop Beats", categoryame: "Hip-Hop", xpPoints: "180", countSongs: "18", duration: "50 min", image: "image3"),
        MusicDetail(musicname: "Classical Symphony", categoryame: "Classical", xpPoints: "250", countSongs: "25", duration: "1 hr 30 min", image: "image4"),
        MusicDetail(musicname: "Jazz Essentials", categoryame: "Jazz", xpPoints: "170", countSongs: "14", duration: "55 min", image: "image5")
    ]
    
    var timer: Timer?
        var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview1.register(UINib(nibName: "categoryCVC", bundle: .main), forCellWithReuseIdentifier: "categoryCVC")
        collectionview2.register(UINib(nibName: "ContinueCVC", bundle: .main), forCellWithReuseIdentifier: "ContinueCVC")
        collectionview3.register(UINib(nibName: "MusicPlaylistCVC", bundle: .main), forCellWithReuseIdentifier: "MusicPlaylistCVC")
        collectionview4.register(UINib(nibName: "RecommededCVC", bundle: .main), forCellWithReuseIdentifier: "RecommededCVC")
        tableview1.register(UINib(nibName: "TrendingListTVC", bundle: .main), forCellReuseIdentifier: "TrendingListTVC")
        holderview1.layer.cornerRadius = 20
        searchTF.layer.cornerRadius = 25
        searchHolderView.layer.cornerRadius = 25
        tableview1.layer.cornerRadius = 10
        trendingImageview.layer.cornerRadius = 10
        recommendedImageView.layer.cornerRadius = 10
        categories = [
                    Category(categoryName: "Free"),
                    Category(categoryName: "For Study"),
                    Category(categoryName: "For Work"),
                    Category(categoryName: "For Focus")
                ]
        
        CollectionViewPageControl.numberOfPages = musicArray.count
                CollectionViewPageControl.currentPage = 0
        
        startAutoScroll()
        updateImage()
    }
    
    func startAutoScroll() {
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(changePage), userInfo: nil, repeats: true)
        }
        
        @objc func changePage() {
            if currentIndex < musicArray.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
            
            // Update Page Control
            CollectionViewPageControl.currentPage = currentIndex
            
            // Reload CollectionView
            collectionview4.reloadData()
            
            // Animate Image Change
            updateImage()
        }
        
        func updateImage() {
            let newImage = UIImage(named: musicArray[currentIndex].image ?? "")
            
            UIView.transition(with: recommendedImageView, duration: 0.8, options: .transitionFlipFromRight, animations: {
                self.recommendedImageView.image = newImage
            }, completion: nil)
        }
    
    
    @IBAction func TrendingPlayBtn(_ sender: UIButton) {
        print("btn is tapped")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionview1 {
            return categories.count
        } else if collectionView == collectionview2 {
            return musicArray.count
        }else if collectionView == collectionview3 {
            return musicArray.count
        }else if collectionView == collectionview4 {
            return musicArray.count
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionview1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCVC", for: indexPath) as! categoryCVC
            let category = categories[indexPath.item]
            cell.categoryNameLbl.text = category.categoryName
            cell.layer.cornerRadius = collectionview1.frame.height/2
            return cell
        } else  if collectionView == collectionview2 {
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContinueCVC", for: indexPath) as! ContinueCVC
            cell.layer.cornerRadius = 20
            cell.imageview.image = UIImage(named: "\(musicArray[indexPath.row].image ?? "")")
            cell.musicLabel.text = musicArray[indexPath.row].musicname
            cell.songsandxplbl.text = "\(musicArray[indexPath.row].countSongs ?? "")songs ● \(musicArray[indexPath.row].xpPoints ?? "")XP"
                return cell
        } else  if collectionView == collectionview3 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicPlaylistCVC", for: indexPath) as! MusicPlaylistCVC
            cell.layer.cornerRadius = 20
            cell.imageview.image = UIImage(named: "\(musicArray[indexPath.row].image ?? "")")
            cell.MusicName.text = musicArray[indexPath.row].categoryame ?? ""
            cell.countXPLbl.text = "\(musicArray[indexPath.row].countSongs ?? "")songs ● \(musicArray[indexPath.row].xpPoints ?? "")XP"
            
            return cell
    }
        else  if collectionView == collectionview4 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommededCVC", for: indexPath) as! RecommededCVC
            cell.layer.cornerRadius = 20
            let music = musicArray[currentIndex]

            cell.label1.text = "Music •\(music.categoryame ?? "")"
            cell.label2.text = "\(music.musicname ?? "")"
                    cell.label3.text = "\(music.duration ?? "") • \(music.xpPoints ?? "")XP"
                    //cell.imageview.image = UIImage(named: "\(music.image ?? "")")
            
            return cell
    }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionview1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if collectionView == collectionview2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MusicListVC") as! MusicListVC
           
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if collectionView == collectionview3 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MusicListVC") as! MusicListVC
           
            self.navigationController?.pushViewController(vc, animated: true)
        }
//        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicListVC") as! MusicListVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingListTVC", for: indexPath) as! TrendingListTVC
        cell.layer.cornerRadius = 20
        cell.imageview.image = UIImage(named: "\(musicArray[indexPath.row].image ?? "")")
        cell.nameLbl.text = musicArray[indexPath.row].musicname
        cell.timeAndXPLbl.text = "\(musicArray[indexPath.row].duration ?? "")  • \(musicArray[indexPath.row].xpPoints ?? "")XP"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if we want to semnd data of selected row then we can send it by from this function
        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
        vc.selectedMusic = self.musicArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collectionview1{
            return UIEdgeInsets.init(top: 20, left: 00, bottom: 20, right: 10)
        }else if collectionView == collectionview2{
            return UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        }else if collectionView == collectionview3{
            return UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        }
        return UIEdgeInsets.init(top: 20, left: 00, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionview2{
            return 20
        }
        if collectionView == collectionview3{
            return 20
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionview2{
            return 20
        }
        if collectionView == collectionview3{
            return 20
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionview1{
            let width = ((collectionview1.frame.width-40)/4)
            let height = collectionview1.frame.height
            return CGSize(width: width, height: height)
        }
        else if collectionView == collectionview2{
            let width = ((collectionview2.frame.width-60)/2.2)
            let height = collectionview2.frame.height
            return CGSize(width: width, height: height)
        }
        else if collectionView == collectionview3{
            let width = ((collectionview3.frame.width-60)/2.2)
            let height = collectionview3.frame.height
            return CGSize(width: width, height: height)
        }
        else if collectionView == collectionview4{
            let width = ((collectionview4.frame.width))
            let height = collectionview4.frame.height
            return CGSize(width: width, height: height)
        }
        let width = ((collectionview1.frame.width))
        let height = collectionview1.frame.height
        return CGSize(width: width, height: height)
    }
}
