//
//  AppDelegate.swift
//  DeepLinkTest
//
//  Created by User on 06.02.2024.
//

import UIKit
import AppsFlyerLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        AppsFlyerLib.shared().appsFlyerDevKey = "123"
        AppsFlyerLib.shared().appleAppID = "12343"
        AppsFlyerLib.shared().deepLinkDelegate = self
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didBecomeActiveNotification),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        return true
    }
    
    @objc func didBecomeActiveNotification() {
        AppsFlyerLib.shared().start()
    }
}

extension AppDelegate: DeepLinkDelegate {
    func didResolveDeepLink(_ result: DeepLinkResult) {
        var textStr: String?
        switch result.status {
        case .notFound:
            NSLog("❌ [AFSDK] Deep link not found")
            return
        case .failure:
            print("❗️ Error %@", result.error!)
            return
        case .found:
            NSLog("✅ [AFSDK] Deep link found")
        }
        guard let deepLinkObj: DeepLink = result.deepLink else {
            NSLog("❗️ [AFSDK] Could not extract deep link object")
            return
        }
        if( deepLinkObj.isDeferred == true) {
            NSLog("↩︎ [AFSDK] This is a deferred deep link")
        }
        else {
            NSLog("→ [AFSDK] This is a direct deep link")
        }
        print("DEEP LINK VALUE: \(deepLinkObj.deeplinkValue ?? "No value")")
        textStr = deepLinkObj.deeplinkValue
        if let controller = getCurrentViewController() as? ViewController {
            controller.setText(textStr ?? "No value")
        }
    }
    
    func getCurrentViewController(
        base: UIViewController? = UIApplication.shared.windows.first?.rootViewController
    ) -> UIViewController? {
        if let navigationController = base as? UINavigationController {
            return getCurrentViewController(base: navigationController.visibleViewController)
        }
        if let tabBarController = base as? UITabBarController, let selected = tabBarController.selectedViewController {
            return getCurrentViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return getCurrentViewController(base: presented)
        }
        return base
    }
}
