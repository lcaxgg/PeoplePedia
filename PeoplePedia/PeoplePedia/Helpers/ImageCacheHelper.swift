//
//  ImageCacheHelper.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import UIKit

class ImageCacheHelper {
    static let shared = ImageCacheHelper()
    
    let imageCache = NSCache<NSString, UIImage>()
    var imageUrls: [URL] = []

    private init() {}
    
    func cacheImages() {
        for url in imageUrls {
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                print("Successfully cached image from \(url.absoluteString).")
            }
        }
    }
    
    func getCachedImage(of urlString: String) -> UIImage {
        guard let cachedImage = imageCache.object(forKey: urlString as NSString) else {
            return UIImage()
        }
        
        return cachedImage
    }
}
