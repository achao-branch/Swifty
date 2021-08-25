//
//  ViewController.swift
//  Swiftyy
//
//  Created by Alicia Chao on 8/19/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        
        // Initialize the dictionary for the emoji icons
        let emojiDict = ["👻": "Ghost",
                         "💩": "Poop",
                         "😇": "Angel",
                         "😱": "Scream",
                         "👾": "Alien monster"]

        // The sender is the button that is tapped by the user.
        // Here we store the sender in the selectedButton constant
        let selectedButton = sender

        // Get the emoji from the title label of the selected button
        if let wordToLookup = selectedButton.titleLabel?.text {

            // Get the meaning of the emoji from the dictionary
            let emojiMeaning = emojiDict[wordToLookup]

            // Change the message below to display the meaning of the emoji
//            declare alert object, call action method, display alert message
            let alertController = UIAlertController(title: "Title", message: emojiMeaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}
