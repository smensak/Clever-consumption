//
//  GasViewController.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 14/04/2022.
//

import Foundation
import UIKit
import RealmSwift

class GasViewController : UITableViewController {
    
    var period: String?
    
    override func viewDidLoad() {
        load()
        super.viewDidLoad()
        self.registerCell()
    }
    
    func load() {
        let realm = try! Realm()
        
        let myTip = Tips()
        myTip.text = "Some super usefull tip for saving energy"
        myTip.category = "gas"
        
        let gasRecord = NaturalGasRecord()
        gasRecord.amount = 10
        gasRecord.units = "m3"
        gasRecord.date = Date.now
        
        try! realm.write {
            realm.add(myTip)
            realm.add(gasRecord)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var id = "", title = "", bodyText = ""
        
        let realm = try! Realm()
       
        switch indexPath.section {
        case 0:
            id = "TipCustomCell"
            title = "Did you know?"
            bodyText = realm.objects(Tips.self).filter("category LIKE 'gas'").first?.text ?? ""
            
        case 1:
            id = "DayCustomCell"
            let gasConsumption = realm.objects(NaturalGasRecord.self).sorted(byKeyPath: "date").first
            title = String(gasConsumption?.amount ?? 0.0) + (gasConsumption?.units ?? " m3")
            bodyText = "trend descr"
            
        case 2:
            id = "WeekCustomCell"
            title = String(totalForLastDays(6)) + " m3"
            bodyText = "trend descr"
            
        case 3:
            id = "MonthCustomCell"
            title = String(totalForLastDays(30)) + " m3"
            bodyText = "trend descr"
            
        default:
            break
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? CustomTableViewCell else {
                return UITableViewCell()
            }

        cell.title.text = title
        cell.bodyText.text = bodyText
        cell.icon.image = UIImage(named: "Gas")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 1:
            period = "day"
            fallthrough
        case 2:
            period = "week"
            fallthrough
        case 3:
            period = "month"
            performSegue(withIdentifier: "gasDetail", sender: self)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gasDetail" {
            let dvc = segue.destination as? GasDetailViewController
            dvc?.period = period
        }
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "TipCustomCell")
        self.tableView.register(cell, forCellReuseIdentifier: "DayCustomCell")
        self.tableView.register(cell, forCellReuseIdentifier: "WeekCustomCell")
        self.tableView.register(cell, forCellReuseIdentifier: "MonthCustomCell")
    }
    
    func totalForLastDays(_ days: Int) -> Float {
        let realm = try! Realm()
        var end = days
        let gasConsumption = realm.objects(NaturalGasRecord.self).sorted(byKeyPath: "date")
        if ( gasConsumption.count < days) {
            end = gasConsumption.count
        }
        let slice = gasConsumption[0...end-1]
        var total: Float = 0
        for s in slice {
            total += s.amount
        }
        return total
    }
    
}
