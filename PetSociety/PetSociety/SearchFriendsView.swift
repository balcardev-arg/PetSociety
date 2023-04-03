//
//  SearchFriendsView.swift
//  PetSociety
//
//  Created by Gian Franco Lopez on 31/03/2023.
//

import SwiftUI

struct SearchFriendsView: View {
    @State private var searchText : String = ""
    @State private var showInitialMessage = true
    @State private var searching : Bool = false
    @State private var showingErrorAlert = false
    @State private var errorMessage: String = ""
    
    @State private var people : [User] = []
    
    var body: some View {
        NavigationView(){
            if showInitialMessage {
                Text("Type a least 3 characters and press enter to perform a search of people to add as friends.")
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .padding(30)
            } else {
                ZStack {
                    List(people) { person in
                        (friends: $people, friend: person.self)
                    }.overlay{
                        if people.count == 0 {
                            Text("There are not people for this criteria. Try again with a different name.")
                                .fontWeight(.black)
                                .multilineTextAlignment(.center)
                                .padding(30)
                        }
                    }
                    if searching {
                        ModalProgressView()
                    }
                }
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search friends")
            .onSubmit(of: .search) {
            }
            .textInputAutocapitalization(.never)
            .alert(errorMessage, isPresented: $showingErrorAlert){}
    }
    
    }

struct SearchFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendsView()
    }
}
