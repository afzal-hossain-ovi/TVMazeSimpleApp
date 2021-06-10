//
//  ShowDetailsView.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import SwiftUI

struct ShowDetailsView: View {
    
    var show: ShowListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 20) {
                ImageLoader(urlString: show.image, size: .init(width: 140, height: 160))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(show.name)
                        .font(.title)
                    
                    Text(show.language)
                        .font(.title3)
                    
                    Text("Rating: \(show.rating)")
                        .font(.title3)
                }
            }.padding()
            
            Text(show.summary)
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .padding()
            
            Spacer()
        }
        .navigationTitle(show.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.actionSheet()
            }) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
            }
        )
        
    }
    
    func actionSheet() {
        guard let data = URL(string: show.officialSite) else { return }
           let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
       }
}
