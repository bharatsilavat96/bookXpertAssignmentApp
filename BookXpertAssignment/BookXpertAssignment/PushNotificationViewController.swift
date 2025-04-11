//
//  PushNotificationViewController.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import UIKit

class PushNotificationViewController: UIViewController {

    
    @IBOutlet weak var enableDisableNotificationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    
    @IBAction func enableDisableNotificationButtonAction(_ sender: UIButton) {
        print("Enable Disable Notification button tapped")
        sender.isSelected = !sender.isSelected
    }
    
}
