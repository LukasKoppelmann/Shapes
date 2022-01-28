//
//  Menu.swift
//  Shapes
//
//  Created by Lukas Koppelmann on 28.01.22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        highScoreLabel.text = String(loadInt(desName: "highScoreSaved"))
        versionLabel.text = "App v." + getVersion()
    }
  
  
  func  loadInt(desName: String) -> Int{
      let defaults = UserDefaults.standard
      if let savedValue = defaults.object(forKey: desName) as? Int{
          print("Loaded '\(savedValue)'")
          return savedValue
      }
      return 0
  }
  func getVersion() -> String {
      let dictionary = Bundle.main.infoDictionary!
      let version = dictionary["CFBundleShortVersionString"] as! String
      return "\(version)"
  }

  @IBOutlet weak var highScoreLabel: UILabel!
  
  @IBAction func startButton(_ sender: Any) {
    let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
    self.navigationController?.pushViewController(gameVC, animated: true)
  }
  
  @IBOutlet weak var versionLabel: UILabel!
  
}
