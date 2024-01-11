//
//  CityInfo3ViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/9/24.
//

import Kingfisher
import UIKit

class CityInfo3ViewController: UIViewController {
    
    var cities = CityInfo().city
    
    @IBOutlet var citiesCollectionView: UICollectionView!
    @IBOutlet var categorySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "CityInfo2CollectionViewCell", bundle: nil)
        citiesCollectionView.register(xib, forCellWithReuseIdentifier: "CityInfo2CollectionViewCell")
        
        citiesCollectionView.dataSource = self
        citiesCollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let spacing : CGFloat = 8
        let cellWidth : CGFloat = (UIScreen.main.bounds.width / 2.5)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing*3, bottom: spacing, right: spacing*3)
        
        citiesCollectionView.collectionViewLayout = layout
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        fileterCities(segmentIndex: sender.selectedSegmentIndex)
    }
}

// MARK: CollectionView관련 Extension 분리
extension CityInfo3ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfo2CollectionViewCell", for: indexPath) as! CityInfo2CollectionViewCell
        
        let url = URL(string: cities[indexPath.item].city_image)
        cell.imageView.kf.setImage(with: url)
        cell.imageView.layer.cornerRadius = 70
        cell.titleLabel.text = "\(cities[indexPath.item].city_name) | \(cities[indexPath.item].city_english_name)"
        cell.subtitleLabel.text = cities[indexPath.item].city_explain
        
        return cell
    }
    
    // MARK: 아이템 선택 시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TravelDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: 도시 선택하는 로직
extension CityInfo3ViewController {
    func fileterCities(segmentIndex index: Int) {
        switch index {
        case 1:
            cities = CityInfo().city.filter { $0.domestic_travel }
        case 2:
            cities = CityInfo().city.filter { !$0.domestic_travel }
        default:
            cities = CityInfo().city
        }
        citiesCollectionView.reloadData()
    }
}
