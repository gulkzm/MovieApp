//
//  AuthController.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 04.03.25.
//

import UIKit


class AuthController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Email or password cannot be empty")
            return
        }
        AuthManager.shared.enter(email: email, password: password) { errorMessage in
            if let errorMessage {
                //TODO: show error alert
                self.showAlert(message: errorMessage)
            } else {
                //TODO: show tabbar
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
//                    sceneDelegate.tabbarRoot(windowScene: windowScene)
                    let coordinator = AppCoordinator(window: sceneDelegate.window, navigationController: self.navigationController ?? UINavigationController())
                    coordinator.start()
                }
            }
        }
    }
}
