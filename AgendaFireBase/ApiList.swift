//
//  ApiList.swift
//  AgendaFireBase
//
//  Created by Bluyin  on 19/1/23.
//

import SwiftUI

struct Model: Hashable, Codable {
    let name: String
    let date: Date
}
class ContentViewModel: ObservableObject {
  @Published var items = [Model]()
  func fetchData() {
    let api = "https://superapi.netlify.app/api/db/eventos"
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode([Model].self, from: data)
           DispatchQueue.main.async {
              self.items = result
           }
         } else {
           print("No data")
         }
      } catch (let error) {
         print(error.localizedDescription)
      }
     }.resume()
  }
}
struct ApiList: View {
   @ObservedObject var viewModel = ContentViewModel()
   var body: some View {
      NavigationView {
         VStack {
            List(viewModel.items, id: \.name) { item in
               HStack {
                   Text(item.name)
                   Spacer()
                   Text(item.date.description)
               }
            }.listStyle(GroupedListStyle())
         }.onAppear(perform: {
         viewModel.fetchData()
         })
         .navigationBarTitle("Lista de eventos")
      }
   }
}
struct ApiList_Previews: PreviewProvider {
    static var previews: some View {
        ApiList()
    }
}
