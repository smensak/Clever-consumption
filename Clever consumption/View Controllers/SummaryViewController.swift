//
//  SummaryViewController.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 21/04/2022.
//

import Foundation
import UIKit
import RealmSwift

class SummaryViewController : UITableViewController {
    
    
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var buttonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.styleButtons()
    }
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        select(button: sender)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var id = "", title = "", bodyText = ""
       
        switch indexPath.section {
        case 0:
            id = "WaterCell"
            title = "300 l"
            bodyText = "trend descr"
            
        case 1:
            id = "GasCell"
            title = "10 m3"
            bodyText = "trend descr"
            
        case 2:
            id = "ElectricityCell"
            title = "15 kWh"
            bodyText = "trend descr"
            
        default:
            break
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? CustomTableViewCell else {
                return UITableViewCell()
        }

        cell.title.text = title
        cell.bodyText.text = bodyText
        cell.icon.image = UIImage(named: "Chart")
        return cell
    }
    
    
    private func registerCell() {
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "WaterCell")
        self.tableView.register(cell, forCellReuseIdentifier: "GasCell")
        self.tableView.register(cell, forCellReuseIdentifier: "ElectricityCell")
    }
    
    func select(button: UIButton) {
        button.tintColor = UIColor.systemBackground
        button.backgroundColor = UIColor.link
        
        var buttons: Set<UIButton> = [dayButton, weekButton, monthButton]
        buttons.remove(button)
        
        deselect(buttons: buttons)
    }
    
    func deselect(buttons: Set<UIButton>) {
        for button in buttons {
            button.tintColor = UIColor.link
            button.backgroundColor = UIColor.systemBackground
        }
    }
    
    func styleButtons() {
        buttonView.layer.cornerRadius = 10
        dayButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        dayButton.layer.cornerRadius = 9
        monthButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        monthButton.layer.cornerRadius = 9
        select(button: dayButton)
    }
}
