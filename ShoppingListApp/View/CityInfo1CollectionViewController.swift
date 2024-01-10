//
//  CityInfo1CollectionViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/9/24.
//

import Kingfisher
import UIKit

// MARK: CollectionViewController 활용
class CityInfo1CollectionViewController: UICollectionViewController {

    let cities = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let spacing : CGFloat = 8
        let cellWidth : CGFloat = (UIScreen.main.bounds.width / 2.4)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing*3, bottom: spacing, right: spacing*3)
        
        collectionView.collectionViewLayout = layout
    }
    
    // 1. 셀 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    // 2. 셀 데이터 & 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfo1CollectionViewCell", for: indexPath) as! CityInfo1CollectionViewCell
        
        let url = URL(string: cities[indexPath.item].city_image)
        cell.imageView.kf.setImage(with: url)
        cell.imageView.layer.cornerRadius = 65
        
        cell.titleLabel.text = "\(cities[indexPath.item].city_name) | \(cities[indexPath.item].city_english_name)"
        cell.subtitleLabel.text = cities[indexPath.item].city_explain
        
        return cell
    }
}
