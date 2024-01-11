//
//  DetailViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let travelDetail = TravelInfo().travel
    
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        configureTableView()
        setNavigationBarItem()
    }
}

extension DetailViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !travelDetail[indexPath.row].ad! {
            //  광고
            let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailTableViewCell.identifier, for: indexPath) as! CityDetailTableViewCell
            return cell
        } else {
            // 관광지
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            return cell
        }
    }
}

extension DetailViewController {
    func configureTableView() {
        navigationItem.title = "도시 상세 정보"
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let xib1 = UINib(nibName: CityDetailTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib1, forCellReuseIdentifier: CityDetailTableViewCell.identifier)
        
        let xib2 = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: ADTableViewCell.identifier)
    }
    
    func setNavigationBarItem() {
        let image = UIImage(systemName: "chevron.left")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
