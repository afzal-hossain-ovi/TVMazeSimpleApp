//
//  ContentView.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    
    @ObservedObject var showVM: ShowViewModel
    
    init() {
        self.showVM = ShowViewModel(service: .init())
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(text: $showVM.showName) {
                    self.showVM.search()
                }
                
                List(self.showVM.showList, id: (\.id)) {show in
                    
                    NavigationLink(
                        destination: ShowDetailsView(show: show),
                        label: {
                            ListCell(show: show)
                    })
                }
            }
           
            .navigationTitle("TV Show")
        }
    }
}

struct ListCell: View {
    var show: ShowListViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            
            ImageLoader(urlString: show.image, size: .init(width: 100, height: 120))
            
            VStack(alignment: .leading) {
                Text(show.name)
                    .font(.title)
                
                Text(show.language)
                    .font(.title3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
