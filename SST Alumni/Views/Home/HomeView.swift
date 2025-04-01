//
//  HomeView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var appState: AppState
    
    var body: some View {
        SecurityAccessWrapper(tab: $appState) {
            NewsArticleSectionView()
        }
    }
}
