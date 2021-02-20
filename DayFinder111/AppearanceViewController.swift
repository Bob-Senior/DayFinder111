//
//  AppearanceViewController.swift
//  DayFinder111
//
//  Created by BOBUR on 20/02/2021.
//

import UIKit

class AppearanceViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    setLabelText()
        // Do any additional setup after loading the view.
    }
 
    @IBAction func openSettingsButtonTapped(_ sender: Any) {
        openSettings()
    }
    
  
    @IBAction func CloseButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func setLabelText() {
        var text = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \n Go to settings if you would like \n to change Dark Mode"
        }
        textLabel.text = text
    }
    
    
    func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:]) { (success) in
                print("open: ", success)
        }
    }
}
}

extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
