//
//  LocationDetailView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @ObservedObject var location: Location

    var body: some View {
        Form {
            // Location Overview Section
            Section(header: Text("Location Details")) {

                HStack {
                    Text("Name")
                    Spacer()
                    Text(location.name)
                        .foregroundColor(.secondary)
                }

                if let address = location.address {
                    HStack {
                        Text("Address")
                        Spacer()
                        Text(address)
                            .foregroundColor(.secondary)
                    }
                }

                if let description = location.description {
                    HStack(alignment: .top) {
                        Text("Description")
                        Spacer()
                        Text(description)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }

            // Coordinates Section
            if let coordinates = location.coordinates {
                Section(header: Text("Coordinates")) {
                    VStack(alignment: .leading) {
                        Text("Latitude: \(coordinates.latitude)")
                        Text("Longitude: \(coordinates.longitude)")
                    }

                    Map(
                        coordinateRegion: .constant(
                            MKCoordinateRegion(
                                center: coordinates,
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        ),
                        interactionModes: []
                    )
                    .frame(height: 200)
                    .cornerRadius(10)
                }
            }

            // Photo Section
            Section(header: Text("Photo")) {
                if let photo = location.photo {
                    Image(uiImage: photo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                } else {
                    Text("No photo available")
                        .foregroundColor(.secondary)
                }
            }

            // Animals Section (if any)
            if let animals = location.animals, !animals.isEmpty {
                Section(header: Text("Associated Animals")) {
                    ForEach(animals, id: \.self) { animalID in
                        HStack {
                            Text("Animal ID")
                            Spacer()
                            Text(animalID.uuidString)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }
            }

            // Pinned Status
            Section {
                HStack {
                    Text("Pinned")
                    Spacer()
                    Text(location.isPinned ? "Yes" : "No")
                        .foregroundColor(.secondary)
                }
            }

            // Button Section for Editing
            Section {
                NavigationLink(destination: LocationEditorView(location: location)) {
                    Text("Edit Location Details")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Location Details")
    }
}

#Preview {
    @Previewable @State var previewLocation: Location = LocationClass().testLocationList[2]
    LocationDetailView(location: previewLocation)
}
