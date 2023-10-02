//
//  StoreViewController.swift
//  clickerGameStoreKilo
//
//  Created by Miles Richmond on 10/15/23.
//

import UIKit

class StoreViewController: UIViewController {
    
    var delegate: ViewController!
    let upgrade1Base: Int = 9
    let upgrade2Base: Int = 27
    var upgrade1Count: Int = 1
    var upgrade2Count: Int = 1
    var upgrade1Cost: Int!
    var upgrade2Cost: Int!

    @IBOutlet weak var upgrade2Cost_label: UILabel!
    @IBOutlet weak var upgrade1Cost_label: UILabel!
    @IBOutlet weak var cubeCount_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        upgrade1Count = delegate.upgrade1Count
        upgrade2Count = delegate.upgrade2Count
        
        upgrade1Cost = upgrade1Base * (upgrade1Count * upgrade1Count)
        upgrade2Cost = upgrade2Base * (upgrade2Count * upgrade2Count)
        
        cubeCount_label.text = "Cubes: \(delegate.cubes)"
        upgrade1Cost_label.text = "Upgrade 1 Cost: \(upgrade1Cost!)"
        upgrade2Cost_label.text = "Upgrade 2 Cost: \(upgrade2Cost!)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.updateScreen()
        delegate.upgrade1Count = upgrade1Count
        delegate.upgrade2Count = upgrade2Count
    }
    
    
    @IBAction func upgrade1_action(_ sender: UIButton) {
        if(delegate.cubes < upgrade1Cost) {
            return
        }
        
        delegate.clickValue *= 3
        
        upgrade1Count += 1
        delegate.cubes -= upgrade1Cost
        viewWillDisappear(false)
        viewWillAppear(true)
    }
    
    @IBAction func upgrade2_action(_ sender: UIButton) {
        if(delegate.cubes < upgrade2Cost) {
            return
        }
        
        delegate.clickValue *= 9
        
        upgrade2Count += 1
        delegate.cubes -= upgrade2Cost
        viewWillDisappear(false)
        viewWillAppear(true)
    }
    
}
