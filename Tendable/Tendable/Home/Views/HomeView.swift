//
//  HomeView.swift
//  Tendable
//
//  Created by KranTush on 11/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter = THomeViewPresenter()
    var body: some View {
        
        VStack{
            TabView {
                Group{
                    HistoryView()
                        .tabItem {
                            Label("History", systemImage: "square.and.pencil")
                        }
                    
                    InspectView()
                        .tabItem {
                            Label("Inspect", systemImage: "list.dash")
                        }
                } .toolbarBackground(UIConstants.appColor, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.light, for: .tabBar)
                
            }.tint(Color.black)
        }.modifier(TBackgroundView(showLoader: $presenter.showLoader))
            .navigationTitle("Home")
            .navigationBarBackButtonHidden(true)
            
    }
}

struct HistoryView: View{
  
    @ObservedObject var presenter = THistoryPresenter()
    var body: some View{
       
        List{
            ForEach(Array(presenter.inspectors.enumerated()), id:\.element.id){
                (index, item) in
                
                Section(item.name!){
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text(item.name!)
                        
                        Text(String(item.id))
                    }
                }
            }
        }.onAppear(){
            
            if(presenter.inspectors.isEmpty)
            {
                presenter.getInspector()
            }
        }
    }
    
}

struct InspectView: View{
   
    @ObservedObject var presenter = TInspectPresenter()

    var body: some View{
        
            List{
                ForEach(Array(presenter.categories.enumerated()), id: \.element.id){ idx , category in
                    
                    Section(presenter.categories[idx].name, content: {
                            TextCell(questions: $presenter.categories[idx].questions, action: { index in
                                presenter.changeValue(index: index)
                            }, categoryIndex: idx)
                        })
                }
                TButton(title: "Submit Inspection") {
                    presenter.submitInspection()
                }
                
            }.scrollContentBackground(.visible).background(.clear)
            .onAppear(){
                
                if(presenter.categories.isEmpty)
                {
                    presenter.getAllInspections()
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
