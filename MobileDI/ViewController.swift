//
//  ViewController.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 13/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import UIKit
import Toaster

class ViewController: UIViewController {

	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.navigationController?.isNavigationBarHidden = true
		passwordTextField.isSecureTextEntry = true
		emailTextField.layer.cornerRadius = 15.0
		emailTextField.borderStyle = UITextBorderStyle.roundedRect
		passwordTextField.layer.cornerRadius = 15.0
		passwordTextField.borderStyle = UITextBorderStyle.roundedRect
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	@IBAction func loginButton(_ sender: UIButton) {
		passwordTextField.resignFirstResponder()
		emailTextField.resignFirstResponder()
		if emailTextField.text! != "" {
			if AppHelper.isValidEmail(testStr: emailTextField.text!) {
				if passwordTextField.text! != "" {
				AppHelper.saveToUserDefault(value: "nikhil", key: "LoggedIn")
				self.dismiss(animated: false, completion: nil)
				let storyboard = UIStoryboard(name: "Main", bundle: nil)
				let viewController = storyboard.instantiateViewController(withIdentifier :"FeedsViewController") as! FeedsViewController
				self.present(viewController, animated: true)
				} else {
					Toast(text: "Enter Password", delay: Delay.short, duration: Delay.long).show()
				}
			} else {
				Toast(text: "Enter Email", delay: Delay.short, duration: Delay.long).show()
			}
		} else {
			Toast(text: "Invalid Email", delay: Delay.short, duration: Delay.long).show()
		}
	}



}

