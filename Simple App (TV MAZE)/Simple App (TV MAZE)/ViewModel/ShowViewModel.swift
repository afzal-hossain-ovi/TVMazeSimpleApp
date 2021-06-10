//
//  ShowViewModel.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import Foundation

class ShowViewModel: ObservableObject {
    private var webService: WebService
    @Published var showList = [ShowListViewModel]()
    
    init(service: WebService) {
        webService = service
    }
    
    var showName = ""
    
    func search() {
        if let _showName = self.showName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            self.fetchShowList(by: _showName)
        }
    }
    
    private func fetchShowList(by name: String) {
        webService.getShowListData(by: name) { showModel in
            if let showModel = showModel {
                self.showList = showModel.map(ShowListViewModel.init)
            }
        }
    }
}

class ShowListViewModel {
    var id = UUID()
    var show: Show
    
    init(show: ShowModel) {
        self.show = show.show
    }
    
    var name: String {
        return show.name
    }
    
    var officialSite: String {
        return show.officialSite ?? show.url
    }
    
    var language: String {
        return show.language
    }
    
    var rating: String {
        return String(describing: show.rating.average ?? 0.0)
    }
    
    var image: String {
        return show.image?.medium ?? ""
    }
    
    var summary: String {
        return show.summary.trimHTMLTags() ?? ""
    }
}
