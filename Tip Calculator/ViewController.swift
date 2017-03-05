//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Rushabh on Mar/04/17.
//  Copyright © 2017 Rushabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var percentageSelection: UISegmentedControl!
    @IBOutlet weak var tipPercentageValue: UITextField!
    
    @IBOutlet weak var bottomSection: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_percentage") ?? 18;
        
        print(intValue)
        tipPercentageValue.text = "\(intValue)"
        
        bottomSection.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTapCloseKeyboard(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func updateTipPercentageValue(_ sender: AnyObject) {
        
        let tipPercentages = [18, 20, 25]
        tipPercentageValue.text = "\(tipPercentages[percentageSelection.selectedSegmentIndex])"
        self.calculateTip(sender)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billValue.text!) ?? 00
        
        let tip = bill * (Double(tipPercentageValue.text!) ?? 0) / 100
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UIView.animate(withDuration: 0.7, delay: 0.1, options: UIViewAnimationOptions.transitionCurlUp,  animations: {
            
            self.bottomSection.alpha = 1
            
        })
    }
}

