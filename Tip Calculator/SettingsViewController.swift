//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Rushabh on Mar/04/17.
//  Copyright © 2017 Rushabh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipPercentage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_percentage");
        
        
        defaultTipPercentage.text = "\(intValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func updateDefaultTipPercentage(_ sender: Any) {
        let defaults = UserDefaults.standard
        let value = Double(defaultTipPercentage.text!)
        defaults.set(Int(value!), forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
