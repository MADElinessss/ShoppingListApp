//
//  CityInfoViewModel.swift
//  ShoppingListApp
//
//  Created by Madeline on 4/3/24.
//

import Foundation
import RxCocoa
import RxSwift

class CityInfoViewModel {
    
    var cities = BehaviorRelay<[City]>(value: [])
    let searchText = PublishRelay<String?>()// 초기값이 없어야 함->Publish
    let segmentIndex = BehaviorRelay<Int>(value: 0)// 초기값이 있어야 함->Behavior
    private var allCities = CityInfo.city
    private let disposeBag = DisposeBag()
    
    init() {
        setUpBindings()
    }
    
    func setUpBindings() {

        cities.accept(allCities) // 뷰 뜨자마자 모든 도시로 초기값 설정
        
        searchText
            .withLatestFrom(segmentIndex) { searchText, segmentIndex in
                return (searchText, segmentIndex)
            }
            .map(filterCities)
            .bind(to: cities)
            .disposed(by: disposeBag)
        
        segmentIndex
            .withLatestFrom(searchText.startWith("")) { index, searchText in
                return (searchText, index)
            }
            .map(filterCities)
            .bind(to: cities)
            .disposed(by: disposeBag)
        
    }
    
    // 초기값 설정
//    func loadInitialCities() {
//        let initialCities = filterCities(searchText: "", segmentIndex: segmentIndex.value)
//        cities.accept(initialCities)
//    }
//    
    private func filterCities(searchText: String?, segmentIndex: Int) -> [City] {
        let filteredCities = filterBySegmentIndex(segmentIndex: segmentIndex)
        
        guard let searchText = searchText, !searchText.isEmpty else {
            return filteredCities
        }
        
        return filteredCities.filter {
            $0.city_english_name.lowercased().contains(searchText.lowercased()) ||
            $0.city_name.lowercased().contains(searchText.lowercased()) ||
            $0.city_explain.lowercased().contains(searchText.lowercased())
        }
    }
    
    private func filterBySegmentIndex(segmentIndex: Int) -> [City] {
        switch segmentIndex {
        case 1:
            return allCities.filter { $0.domestic_travel }
        case 2:
            return allCities.filter { !$0.domestic_travel }
        default:
            return allCities
        }
    }
    
}
