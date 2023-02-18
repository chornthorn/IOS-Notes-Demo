//
//  LoginViewController.swift
//  Note Demo App
//
//  Created by thorn on 18/2/23.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let singleScrollView = UIScrollView()
    let containerView = UIView()
    let emailLabelView = UILabel()
    let emailTextFieldView = UITextField()
    let passwordLabelView = UILabel()
    let passwordTextFieldView = UITextField()
    
    let logoView = UIImageView()
    
    let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
      
        style()
        layout()
    }
}

extension LoginViewController {
    
    func style(){
        singleScrollView.backgroundColor = .systemBackground
        // always scroll
        singleScrollView.alwaysBounceVertical = true
        
        
        // logo view
        logoView.image = UIImage(systemName: "apple.logo")
        logoView.contentMode = .scaleAspectFit
        logoView.tintColor = .black
        
        
        
        emailLabelView.text = "Email"
        emailLabelView.textColor = .black
        emailLabelView.font = UIFont.systemFont(ofSize: 16)
        
        emailTextFieldView.backgroundColor = .systemFill
        emailTextFieldView.layer.cornerRadius = 8
        emailTextFieldView.layer.masksToBounds = true
        emailTextFieldView.placeholder = "Enter your email"
        emailTextFieldView.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        emailTextFieldView.leftViewMode = .always
        emailTextFieldView.autocapitalizationType = .none
        emailTextFieldView.autocorrectionType = .no
        emailTextFieldView.returnKeyType = .continue
        
        passwordLabelView.text = "Password"
        passwordLabelView.textColor = .black
        passwordLabelView.font = UIFont.systemFont(ofSize: 16)
        
        passwordTextFieldView.backgroundColor = .systemFill
        passwordTextFieldView.layer.cornerRadius = 8
        passwordTextFieldView.layer.masksToBounds = true
        passwordTextFieldView.placeholder = "Enter your password"
        passwordTextFieldView.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        passwordTextFieldView.leftViewMode = .always
        passwordTextFieldView.autocapitalizationType = .none
        passwordTextFieldView.autocorrectionType = .no
        passwordTextFieldView.returnKeyType = .continue
        
        // login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.setTitleColor(.white, for: .normal)
        // add target
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        
        
    }
    
    func layout(){
        // add all ui to view
        view.addSubview(singleScrollView)
        singleScrollView.addSubview(containerView)
        containerView.addSubview(logoView)
        containerView.addSubview(emailLabelView)
        containerView.addSubview(emailTextFieldView)
        containerView.addSubview(passwordLabelView)
        containerView.addSubview(passwordTextFieldView)
        containerView.addSubview(loginButton)
        
        
        // set up scroll view
        singleScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            singleScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            singleScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            singleScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            singleScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        // set up container
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: singleScrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: singleScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: singleScrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: singleScrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: singleScrollView.widthAnchor),
        ])
        
        // logo view
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            logoView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 120),
            logoView.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        
        // email label
        emailLabelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabelView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40),
            emailLabelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailLabelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        // email textfield
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextFieldView.topAnchor.constraint(equalTo: emailLabelView.bottomAnchor, constant: 10),
            emailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        // password label
        passwordLabelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabelView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 20),
            passwordLabelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordLabelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        // password textfield
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextFieldView.topAnchor.constraint(equalTo: passwordLabelView.bottomAnchor, constant: 10),
            passwordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        // login button
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            
            // bottom
            loginButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
    }
}

extension LoginViewController {
    
    // didTapLoginButton
    @objc func didTapLoginButton(){
        emailTextFieldView.resignFirstResponder()
        passwordTextFieldView.resignFirstResponder()
        
        // check if email and password are empty
        guard let email = emailTextFieldView.text, !email.isEmpty,
              let password = passwordTextFieldView.text, !password.isEmpty else {
            
            // alert
            let alert = UIAlertController(title: "Error", message: "Please enter email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
            return
        }
        
        // check if email is valid
        var isEmailValid = false
        if email.contains("@") && email.contains(".") {
            isEmailValid = true
        }
        
        // check if password is valid
        var isPasswordValid = false
        if password.count >= 5 {
            isPasswordValid = true
        }
        
        guard isEmailValid && isPasswordValid else {
            
            // alert
            let alert = UIAlertController(title: "Error", message: "Please enter valid email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
            return
        }
        
    
        // alamofire
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request("\(BASE_URL)/auth/sign-in", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            
            // check if response is successful
            guard response.response?.statusCode == 200 else {
                
                // alert
                let alert = UIAlertController(title: "Error", message: "Invalid email or password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
                return
            }
            
            guard let userData = response.value?.data else {
                return
            }
            
            // save user id
            UserDefaults.standard.set(userData.id, forKey: USER_ID_KEY)
            
            // show tabbarView from AppDelegate
            AppDelegate.animateTabBar();
            
        }
        
        
    }
    
}
