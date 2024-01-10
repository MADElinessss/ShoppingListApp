//
//  ShoppingListTableViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/8/24.
//

import UIKit

struct Shopping {
    let list: String
    var isFavorite: Bool
    var isChecked: Bool
}

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet var addTextField: UITextField!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList : [Shopping] = [Shopping(list: "그립톡 구매하기", isFavorite: false, isChecked: false),
                                     Shopping(list: "사이다 구매", isFavorite: false, isChecked: false),
                                     Shopping(list: "아이패드 케이스 최저가 알아보기", isFavorite: false, isChecked: false),
                                     Shopping(list: "양말", isFavorite: false, isChecked: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designBackground()
        
    }
    
    // MARK: TableView 필수 메서드
    // 1. 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    // 2. 셀 디자인, 데이터
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell") as! ShoppingListTableViewCell
        
        cell.cellBackground.layer.cornerRadius = 10
        cell.shoppingItem.text = shoppingList[indexPath.row].list
        cell.shoppingItem.font = .systemFont(ofSize: 12, weight: .medium)
        
        // MARK: checkBox - isChecked
        let checkBox = shoppingList[indexPath.row].isChecked ? "checkmark.square.fill" : "checkmark.square"
        cell.checkBoxButton.setImage(UIImage(systemName: checkBox), for: .normal)
        
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        cell.checkBoxButton.tag = indexPath.row
        
        // MARK: star button - isFavorite
        let star = shoppingList[indexPath.row].isFavorite ? "star.fill" : "star"
        cell.starButton.setImage(UIImage(systemName: star), for: .normal)
        
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        shoppingList.append(Shopping(list: addTextField.text ?? "", isFavorite: false, isChecked: false))
        addTextField.text = ""
        tableView.reloadData()
    }
    
    @objc func checkBoxButtonTapped(sender: UIButton) {
        shoppingList[sender.tag].isChecked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    @objc func starButtonTapped(sender: UIButton) {
        shoppingList[sender.tag].isFavorite.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    // 3. 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: swipe and delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func designBackground() {
        backgroundView.layer.cornerRadius = 10
        addButton.layer.cornerRadius = 10
    }
}
