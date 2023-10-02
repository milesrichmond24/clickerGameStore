//
//  ViewController.swift
//  clickerGameStoreKilo
//
//  Created by MILES RICHMOND on 10/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    var cubes: Int = 0
    var clickValue: Int = 3
    var upgrade1Count: Int = 1
    var upgrade2Count: Int = 1

    @IBOutlet weak var cubes_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cubes_label.text = "Cubes: \(cubes)"
    }
    
    func updateScreen() {
        cubes_label.text = "Cubes: \(cubes)"
    }

    @IBAction func click_action(_ sender: UIButton) {
        cubes += clickValue
        updateScreen()
    }
    
    @IBAction func store_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toStore", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! StoreViewController
        nextViewController.delegate = self
    }
}

