//
//  AlumniServicesView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct AlumniServicesView: View {
    var body: some View {
        NavigationStack {
            List {
//                AlumniServicesRowView(image: Image(.sampleField), title: "Loan-A-Venue", description: "Need some space for a badminton match? As part of SSTAA, you can book a venue within SST!", ctaTitle: "Book", actionURL: URL(string: "https://sst.edu.sg")!)
                
                AlumniServicesRowView(title: "SSTAA Registration System (SSTAARS)", description: "Helping out with an SSTAA event? Access the Event Registration System here.", ctaTitle: "Access Tool") {
                    SSTAARSView()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Alumni Services")
        }
    }
}

#Preview {
    AlumniServicesView()
}
