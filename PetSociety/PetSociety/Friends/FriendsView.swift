//
//  FriendsView.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 11/04/2023.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var friends: [User] = []
    @State var searchText : String = ""
    @State private var showingErrorAlert = false
    @State private var errorMessage: String = ""

    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                HStack {
                    ZStack {
                        Text(friend.imageUrl)
                            .shadow(radius: 3)
                            .font(.largeTitle)
                            .frame(width: 65, height: 65)
                            .overlay(
                                Circle().stroke(Color.blue, lineWidth: 3)
                            )
                        
                    }
                    Text(friend.name)
                        .font(.headline)
                }
            }.searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: Text("Search Friends"))
            .onSubmit(of: .search) {
                getUser(queryString: searchText)
            }
            .textInputAutocapitalization(.never)
            .alert(errorMessage, isPresented: $showingErrorAlert){}
        }
        
       
    }
    
    private func getUser(queryString: String) {
        
        let url = URL(string: "https://us-central1-balcardev-wishlist.cloudfunctions.net/app/api/friends?query=\(queryString)")
        let request = URLRequest(url: url!)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let friends = try? JSONDecoder().decode([User].self, from: data)  else {
                print("usuario no encontrado")
                return
            }
            
            self.friends = friends
            
            
        }.resume()
    }
    
    
    
    struct FriendsView_Previews: PreviewProvider {
        static var previews: some View {
            FriendsView()
        }
    }
}
