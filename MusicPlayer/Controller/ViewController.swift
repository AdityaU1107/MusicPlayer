//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Vikas Hareram Shah on 02/02/25.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    var categories: [Category] = []
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var toggleview: UIView!
    
    @IBOutlet weak var trendingImageview: UIImageView!
    @IBOutlet weak var collectionview1: UICollectionView!
    
    @IBOutlet weak var collectionview2: UICollectionView!
    @IBOutlet weak var collectionview3: UICollectionView!
    @IBOutlet weak var holderview1: UIView!
    @IBOutlet weak var collectionview4: UICollectionView!
    
    @IBOutlet weak var searchHolderView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableview1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview1.register(UINib(nibName: "categoryCVC", bundle: .main), forCellWithReuseIdentifier: "categoryCVC")
        collectionview2.register(UINib(nibName: "ContinueCVC", bundle: .main), forCellWithReuseIdentifier: "ContinueCVC")
        collectionview3.register(UINib(nibName: "MusicPlaylistCVC", bundle: .main), forCellWithReuseIdentifier: "MusicPlaylistCVC")
        tableview1.register(UINib(nibName: "TrendingListTVC", bundle: .main), forCellReuseIdentifier: "TrendingListTVC")
        holderview1.layer.cornerRadius = 20
        searchTF.layer.cornerRadius = 25
        searchHolderView.layer.cornerRadius = 25
        tableview1.layer.cornerRadius = 10
        trendingImageview.layer.cornerRadius = 10
        categories = [
                    Category(categoryName: "Free"),
                    Category(categoryName: "For Study"),
                    Category(categoryName: "For Work"),
                    Category(categoryName: "For Focus")
                ]
    }
    

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionview1 {
            return categories.count
        } else if collectionView == collectionview2 {
            return 4
        }else if collectionView == collectionview3 {
            return 4
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
                return cell
        } else  if collectionView == collectionview3 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicPlaylistCVC", for: indexPath) as! MusicPlaylistCVC
            cell.layer.cornerRadius = 20
            return cell
    }
        return UICollectionViewCell()
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingListTVC", for: indexPath) as! TrendingListTVC
        cell.layer.cornerRadius = 20
        return cell
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
        let width = ((collectionview1.frame.width))
        let height = collectionview1.frame.height
        return CGSize(width: width, height: height)
    }
}
