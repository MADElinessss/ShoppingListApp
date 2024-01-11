//
//  DetailViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/11/24.
//

import Kingfisher
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
            // 관광지
            let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailTableViewCell.identifier, for: indexPath) as! CityDetailTableViewCell
            cell.titleLabel?.text = travelDetail[indexPath.row].title
            cell.descriptionLabel.text = travelDetail[indexPath.row].description
            cell.likeBadgeImage.image = UIImage(systemName: travelDetail[indexPath.row].like ?? false ? "heart.fill" : "heart")
            let saveNum = travelDetail[indexPath.row].save!.formatted()
            cell.saveAndReviewLabel.text = "(\(travelDetail[indexPath.row].grade!)) · 저장 \(saveNum)"
            let url = URL(string: travelDetail[indexPath.row].travel_image ?? "")
            cell.cityImageView.kf.setImage(with: url)
            
            return cell
        } else {
            // 광고
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            cell.badgeLabel.clipsToBounds = true
            cell.badgeLabel.layer.cornerRadius = 6
            cell.adTitleLabel.text = travelDetail[indexPath.row].title
            cell.backgroundColor = UIColor(
                red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1
            )
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelDetail[indexPath.row].ad! {
            return 70
        } else {
            return 150
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travelDetail[indexPath.row].ad! {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "ADViewController") as! ADViewController
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        } else {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "TravelViewController") as! TravelViewController
            navigationController?.pushViewController(viewController, animated: true)
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
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.title = "인기 도시"// 안됨ㅠㅠ
    }
    
    @objc func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
