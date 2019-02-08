//
//  LoginVC.swift
//  GoParking
//
//  Created by Hadi Albinsaad on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import Spring

class LoginVC: UIViewController, SAPFioriLoadingIndicator
{
    
    
    @IBOutlet weak var signInLabel: SpringLabel!
    @IBOutlet weak var descriptionLabel: SpringLabel!
    @IBOutlet weak var logoImageView: SpringImageView!
    
    @IBOutlet weak var usernameView: CustomView!
    @IBOutlet weak var passwordView: CustomView!
    @IBOutlet weak var signInButton: SpringButton!
    
    var loadingIndicator: FUILoadingIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        loadingIndicator = FUILoadingIndicatorView()
        animateElements()
    }
    
    
    func animateElements()
    {
        let duration:CGFloat = 2
        
        //logo view
        logoImageView.animation = "fadeInDown"
        logoImageView.curve = "easeIn"
        logoImageView.duration = duration
        logoImageView.animate()
        
        
        //username view
        usernameView.animation = "squeezeRight"
        usernameView.curve = "easeIn"
        usernameView.duration = duration
        usernameView.delay = 1
        usernameView.animate()
        
        
        //password view
       passwordView.animation = "squeezeRight"
        passwordView.curve = "easeIn"
        passwordView.duration = duration
        passwordView.delay = 1.5
        passwordView.animate()
        
        //sign in button
        signInButton.animation = "squeezeRight"
        signInButton.curve = "easeIn"
        signInButton.duration = duration
        signInButton.delay = 2
        signInButton.animate()
        
        
        //signIn Label
        signInLabel.animation = "fadeIn"
        signInLabel.curve = "easeIn"
        signInLabel.duration = duration
        signInLabel.delay = 3.5
        signInLabel.animate()
        
        
        //description Label
        descriptionLabel.animation = "fadeIn"
        descriptionLabel.curve = "easeIn"
        descriptionLabel.duration = duration
        descriptionLabel.delay = 4
        descriptionLabel.animate()
    }
 
    @IBAction func login(_ sender: UIButton) {
        showFioriLoadingIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            let vc = Constants.Storyboard.MapVC.instantiateViewController(withIdentifier: "MapVC") as! MapVC
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

