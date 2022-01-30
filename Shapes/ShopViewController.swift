//
//  ShopViewController.swift
//  Shapes
//
//  Created by Lukas Koppelmann on 29.01.22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    let priceItemOne = 99
    let priceItemTwo = 102
    var itemOneUnlocked = 0
    var itemTwoUnlocked = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        itemOnePrice.text = String(priceItemOne) + " coins"
      itemTwoLabel.text = String(priceItemTwo) + " coins"
      if loadInt(desName: "itemOneUnlocked") == 1{
        // TODO: Change font size
        //  itemOneButton.titleLabel?.font = UIFont(name: "System", size: 12)!
        itemOneButton.setTitle("select", for: .normal)
        itemOneButton.tintColor = .green
        itemOnePrice.text = ""
      }
      if loadInt(desName: "currentSkin") == 1{
        itemOneButton.isEnabled = false
        itemOneButton.tintColor = .gray
        itemOneButton.setTitle("selected", for: .disabled)
      }
      if loadInt(desName: "itemTwoUnlocked") == 1{
        // TODO: Change font size
        //  itemOneButton.titleLabel?.font = UIFont(name: "System", size: 12)!
        itemTwoButton.setTitle("select", for: .normal)
        itemTwoButton.tintColor = .green
        itemTwoLabel.text = ""
      }
      if loadInt(desName: "currentSkin") == 2{
        itemTwoButton.isEnabled = false
        itemTwoButton.tintColor = .gray
        itemTwoButton.setTitle("selected", for: .disabled)
      }
        coinsLabel.text = "Coins: " + String(loadInt(desName: "coins"))

        // Do any additional setup after loading the view.
    }
    
  @IBOutlet weak var itemOneButton: UIButton!
  @IBAction func itemoneButton(_ sender: Any) {
    //Buy ItemOne
    var coins = loadInt(desName: "coins")
    if loadInt(desName: "itemOneUnlocked") != 1{
    if  coins >= priceItemOne{
        coins = coins - priceItemOne
        saveInt(nameSafe: coins, desName: "coins")
        coinsLabel.text = "Coins: " + String(loadInt(desName: "coins"))
        itemOneUnlocked = 1
        saveInt(nameSafe: itemOneUnlocked, desName: "itemOneUnlocked")
        let currentSkin = 1
        saveInt(nameSafe: currentSkin, desName: "currentSkin")
       // itemOneButton.tintColor = .gray
        itemOneButton.isEnabled = false
        itemOneButton.setTitle("selected", for: .disabled)
        itemOneButton.setTitle("select", for: .normal)
        itemOnePrice.text = ""
        itemTwoButton.isEnabled = true
      }
    }
    else if loadInt(desName: "itemOneUnlocked") == 1{
      let currentSkin = 1
      saveInt(nameSafe: currentSkin, desName: "currentSkin")
      itemOneButton.isEnabled = false
      itemOneButton.tintColor = .gray
      itemOneButton.setTitle("selected", for: .disabled)
      itemOneButton.setTitle("select", for: .normal)
      itemTwoButton.isEnabled = true
      itemTwoButton.tintColor = .green
    }
  }
  @IBAction func itemTwoButtonP(_ sender: Any) {
    var coins = loadInt(desName: "coins")
    //buy skin2
    if loadInt(desName: "itemTwoUnlocked") != 1{
    if  coins >= priceItemTwo{
        coins = coins - priceItemTwo
        saveInt(nameSafe: coins, desName: "coins")
        coinsLabel.text = "Coins: " + String(loadInt(desName: "coins"))
        itemTwoUnlocked = 1
        saveInt(nameSafe: itemTwoUnlocked, desName: "itemTwoUnlocked")
        let currentSkin = 2
        saveInt(nameSafe: currentSkin, desName: "currentSkin")
        //itemTwoButton.tintColor = .gray
        itemTwoButton.isEnabled = false
        itemTwoButton.setTitle("selected", for: .disabled)
        itemTwoButton.setTitle("select", for: .normal)
        itemTwoLabel.text = ""
        itemOneButton.isEnabled = true
      }
    } //end of buy skin
    //
    else if loadInt(desName: "itemTwoUnlocked") == 1{
        let currentSkin = 2
        saveInt(nameSafe: currentSkin, desName: "currentSkin")
        itemTwoButton.isEnabled = false
        itemTwoButton.tintColor = .gray
        itemTwoButton.setTitle("selected", for: .disabled)
        itemOneButton.isEnabled = true
        itemOneButton.tintColor = .green
        itemOneButton.setTitle("select", for: .normal)
    }
  }
  
  
  
  
  
  func  loadInt(desName: String) -> Int{
      let defaults = UserDefaults.standard
      if let savedValue = defaults.object(forKey: desName) as? Int{
          print("Loaded '\(savedValue)'")
          return savedValue
      }
      return 0
  }
  
  func saveInt(nameSafe: Int, desName: String){
      let saveValue = nameSafe
      let defaults = UserDefaults.standard
      defaults.set(saveValue, forKey: desName)
      print("Saved '\(saveValue)'")
    }
  //item1
  @IBOutlet weak var itemOnePrice: UILabel!
  @IBOutlet weak var coinsLabel: UILabel!
  //item 2
  @IBOutlet weak var itemTwoButton: UIButton!
  @IBOutlet weak var itemTwoLabel: UILabel!
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

