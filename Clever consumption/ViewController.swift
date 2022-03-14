//
//  ViewController.swift
//  Clever consumption
//
//  Created by Samuel Mensak on 14/03/2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var test: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test.layer.cornerRadius = 10
        dayButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        dayButton.layer.cornerRadius = 10
        monthButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        monthButton.layer.cornerRadius = 10

    }
    


}

