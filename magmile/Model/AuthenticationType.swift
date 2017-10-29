//
//  AuthenticationType.swift
//  magmile
//
//  Created by Michael Cordero on 9/20/17.
//  Copyright © 2017 Codec Software. All rights reserved.
//

import Foundation

enum AuthenticationType {
    case FACEBOOK
    case GOOGLE
    
    //public methods
    public static func match (url: URL) -> AuthenticationType? {
        let authSource = url.absoluteString.hasPrefix("fb1473270782738317") ? AuthenticationType.FACEBOOK : url.absoluteString.hasPrefix("com.googleusercontent.apps.") ? AuthenticationType.GOOGLE : nil
        return authSource
    }
}
