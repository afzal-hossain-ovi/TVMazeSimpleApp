//
//  ImageLoader.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ImageLoader: View {
    
    var urlString: String
    var size: CGSize
    
    var body: some View {
        WebImage(url: URL(string: urlString))
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .placeholder {
                    Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .cornerRadius(10)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2529496173)), radius: 2, x: 0.0, y: 2)
            .frame(width: size.width, height: size.height, alignment: .center)
    }
    
}
