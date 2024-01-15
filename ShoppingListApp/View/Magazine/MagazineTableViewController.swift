//
//  MagazineTableViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/8/24.
//

import Kingfisher
import UIKit
import WebKit

class MagazineTableViewController: UITableViewController {

    let magazine = MagazineInfo.magazine
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
}

extension MagazineTableViewController {
    // MARK: TableView 필수 메서드
    // 1. 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazine.count
    }
    
    // 2. 셀 디자인, 데이터
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell") as! MagazineTableViewCell
        
        let url = URL(string: magazine[indexPath.row].photo_image)
        
        cell.cellImage.kf.setImage(with: url)
        cell.title.text = magazine[indexPath.row].title
        cell.subtitle.text = magazine[indexPath.row].subtitle
        
        // MARK: 날짜 DateFormatter
        let dateForCell = magazine[indexPath.row].date
        let convertedDate = dateFormatter.date(from: dateForCell) ?? Date.now
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        let convertToString = dateFormatter.string(from: convertedDate)
        cell.date.text = convertToString
        
        return cell
    }
    // 3. 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    
    // MARK: 웹 뷰
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: WebViewController.identifier) as! WebViewController
        viewController.data = indexPath.row
        navigationController?.pushViewController(viewController, animated: true)

    }
}
