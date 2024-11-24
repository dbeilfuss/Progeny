//
//  LocationEditorView.swift
//  Progeny
//
//  Created by Daniel Beilfuss on 11/23/24.
//

import SwiftUI
import MapKit

struct LocationEditorView: View {
    @ObservedObject var location: Location
    
    // State for managing user interaction
    @State private var isEditingCoordinates: Bool = false
    @State private var isAddingPhoto: Bool = false
    
    // Computed bindings for each property
    private var nameBinding: Binding<String> {
        Binding(
            get: { location.name },
            set: { location.name = $0 }
        )
    }
    
    private var addressBinding: Binding<String> {
        Binding(
            get: { location.address ?? "" },
            set: { location.address = $0.isEmpty ? nil : $0 }
        )
    }
    
    private var descriptionBinding: Binding<String> {
        Binding(
            get: { location.description ?? "" },
            set: { location.description = $0.isEmpty ? nil : $0 }
        )
    }
    
    var body: some View {
        Form {
            // General Information Section
            Section(header: Text("Location Details")) {
                TextField("Name", text: nameBinding)
                TextField("Address", text: addressBinding)
                TextEditor(text: descriptionBinding)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.vertical, 5)
            }
            
            // Coordinates Section
            Section(header: Text("Coordinates")) {
                if let coordinates = location.coordinates {
                    HStack {
                        Text("Latitude: \(coordinates.latitude)")
                        Text("Longitude: \(coordinates.longitude)")
                    }
                    Button("Edit Coordinates") {
                        isEditingCoordinates = true
                    }
                } else {
                    Button("Set Coordinates") {
                        isEditingCoordinates = true
                    }
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
                    Text("No Photo Available")
                        .foregroundColor(.gray)
                }
                Button("Add/Change Photo") {
                    isAddingPhoto = true
                }
            }
            
            // Pinned Status
            Section {
                Toggle("Pinned", isOn: $location.isPinned)
            }
        }
        .navigationTitle("Edit Location")
        .sheet(isPresented: $isEditingCoordinates) {
            CoordinatePickerView(location: $location.coordinates)
        }
        .sheet(isPresented: $isAddingPhoto) {
            PhotoPickerView(selectedImage: $location.photo)
        }
    }
}

// Coordinate Picker View
struct CoordinatePickerView: View {
    @Binding var location: CLLocationCoordinate2D?

    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: [.all])
                .edgesIgnoringSafeArea(.all)
            Button("Save Coordinates") {
                location = region.center
            }
            .padding()
        }
    }
}

// Photo Picker View
struct PhotoPickerView: View {
    @Binding var selectedImage: UIImage?

    var body: some View {
        Text("Photo picker placeholder") // Replace with actual photo picker implementation
    }
}

#Preview {
    @Previewable @State var previewLocation: Location = LocationClass().testLocationList[0]
    LocationEditorView(location: previewLocation)
}
