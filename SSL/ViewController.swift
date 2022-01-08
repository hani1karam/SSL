//
//  ViewController.swift
//  SSL
//
//  Created by hany karam on 1/8/22.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.doAiCallUsingPublicKeyPinning()
    }
    private func doAiCallUsingPublicKeyPinning(){
        guard let requestURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {return}
        ServiceManager.shared.callAPI(withURL: requestURL,isCertificatePinning: true) {[weak self] (message) in
            print(message)
            guard let self = self else {return}
            let alert = UIAlertController(title: "SSLPinning", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    

             self.keychain.set(message, forKey: "mykey")
 
        }
    }

}

