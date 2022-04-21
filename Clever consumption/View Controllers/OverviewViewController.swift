//
//  ViewController.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 14/03/2022.
//

import UIKit

class OverviewViewController: UIViewController {


    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 10
        dayButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        dayButton.layer.cornerRadius = 9
        monthButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        monthButton.layer.cornerRadius = 9
        select(button: weekButton)
        
        for view in views {
            view.layer.cornerRadius = 15
        }
    }
    @IBAction func buttonSelected(_ sender: UIButton) {
        select(button: sender)
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
    
}

