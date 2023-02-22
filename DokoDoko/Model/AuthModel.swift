//
//  Auth.swift
//  DokoDoko
//
//  Created by Owner on 2023/02/22.
//

import Foundation
import FirebaseAuth

class AuthModel {
    
    let shared = AuthModel()
    
    var uid: String? = nil
    
    func signIn() {
        Auth.auth().signInAnonymously() { (authResult, error) in
            if let error {
                print("Auth Error :\(error.localizedDescription)")
            }
            
            guard let user = authResult?.user else { return }
            self.uid = user.uid
        }
    }
    
}
