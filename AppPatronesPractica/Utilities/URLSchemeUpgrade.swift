//
//  URLSchemeUpgrade.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 8/10/23.
//

import UIKit

// Upgrades URL Scheme to https (Converts http urls to https)
extension URL {
    func upgradeUrl (url: URL) -> URL {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.scheme = "https"
        guard let finalUrl = urlComponents?.url else {
            return url
        }
        return finalUrl
    }
}
