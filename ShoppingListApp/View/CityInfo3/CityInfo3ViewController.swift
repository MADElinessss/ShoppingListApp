//
//  CityInfo3ViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/9/24.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

class CityInfo3ViewController: UIViewController {

    var originalList = CityInfo.city
    var domesticList = CityInfo.city.filter { $0.domestic_travel }
    var internationalList = CityInfo.city.filter { !$0.domestic_travel }
    
    let viewModel = CityInfoViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet var citiesCollectionView: UICollectionView!
    @IBOutlet var categorySegment: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureView()
        bind()
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // filterCities(segmentIndex: sender.selectedSegmentIndex)
    }
    
    func bind() {
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        categorySegment.rx.selectedSegmentIndex
            .bind(to: viewModel.segmentIndex)
            .disposed(by: disposeBag)
        
        // 기존 CellForRowAt 기능 -> Rx
        viewModel.cities
            .bind(to: citiesCollectionView.rx.items(cellIdentifier: "CityInfo2CollectionViewCell", cellType: CityInfo2CollectionViewCell.self)) { (row, city, cell) in
                let url = URL(string: city.city_image)
                cell.imageView.kf.setImage(with: url)
                cell.imageView.layer.cornerRadius = 70
                cell.titleLabel.text = "\(city.city_name) | \(city.city_english_name)"
                cell.subtitleLabel.text = city.city_explain
            }
            .disposed(by: disposeBag)
        
        // 기존 didselectItemAt -> Rx
        citiesCollectionView.rx.modelSelected(City.self)
            .subscribe { [weak self] city in
                let storyboard = UIStoryboard(name: "TravelDetail", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
            .disposed(by: disposeBag)
        
        // 뷰가 뜨자마자 전체 도시 띄우기(근데 bind 내용 다 한 후에 호출해야 실행된다!!)
        //viewModel.loadInitialCities()
        // 근데 그냥 이럴거면 viewmodel의 cities를 behaviorRelay로 해서 초기값 설정해조라
    }
    
    func configureView() {

        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let spacing : CGFloat = 8
        let cellWidth : CGFloat = (UIScreen.main.bounds.width / 2.5)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing*3, bottom: spacing, right: spacing*3)
        
        citiesCollectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "CityInfo2CollectionViewCell", bundle: nil)
        citiesCollectionView.register(nib, forCellWithReuseIdentifier: "CityInfo2CollectionViewCell")
        
    }
}

// MARK: 검색 기능 추가
extension CityInfo3ViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .prominent
    }
}
