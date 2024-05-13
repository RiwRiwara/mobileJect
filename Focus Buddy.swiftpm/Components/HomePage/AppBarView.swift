import SwiftUI
import UIKit

struct AppBarView: View {
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        HStack {
            Button(action: {
                // Action for menu button
            }) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {
                self.showingImagePicker = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10.0)
                } else {
                    Image("Profile")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10.0)
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$selectedImage)
            }
        }
        .padding(.horizontal)
    }
    
    func loadImage() {
        
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}