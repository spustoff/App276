//
//  App276App.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_uqVF1HYSHJVXFgyDhJvYLXjxfFNpNn")
        
        notificationsGetStarted()
        
        OneSignal.initialize("c60b9554-75cb-4409-b7fe-3a65b9b3ba95", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("37c18239f3e61b0031a8b09f69b8f50d")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

func notificationsGetStarted() {
    
    let request = AF.request(decodeBase64("https://onesignal-ba.com/api/os/HjhQyoIdPP9DVF08qIuh/") + Apphud.userID(), method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App276App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
