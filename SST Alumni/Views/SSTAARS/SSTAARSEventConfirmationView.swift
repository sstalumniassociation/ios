//
//  SSTAARSEventConfirmationView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SSTAARSEventConfirmationView: View {
    
    @ObservedObject var sstaarsManager: SSTAARSManager
    
    var body: some View {
        VStack {
            switch sstaarsManager.eventImportState {
            case .none: EmptyView()
            case .verifying: ProgressView()
            case .serverError:
                VStack(spacing: 16) {
                    Image(systemName: "pc")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 64))
                        
                    Text("Something went wrong.")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("It’s not you, it’s us. Probably.")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
            case .notFound:
                VStack(spacing: 16) {
                    Image(systemName: "eyes")
                        .font(.system(size: 64))
                    
                    Text("Could not find event.")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("This is on you. Definitely you.")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
            case .success(let event):
                VStack {
                    Text(event.name)
                        .font(.title)
                    Text(event.description)
                    Text(event.startDateTime.formatted())
                }
            }
        }
    }
}
