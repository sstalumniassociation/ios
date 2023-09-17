//
//  QRCodeScannerView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI
import AVFoundation

struct QRCodeScannerView: View {
    
    @State private var isScanningDown = false
    @State private var isExpanding = false
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            QRCodeScanner()
            
            if isPresented {
                GeometryReader { reader in
                    let rectanglePath = Rectangle()
                        .path(in: CGRect(origin: .zero, size: reader.size))
                        .cgPath
                    
                    let squareWidth = min(reader.size.width, reader.size.height) - 64
                    
                    let xOffset = (reader.size.width - squareWidth) / 2
                    
                    let yOffset = 64.0
                    
                    let roundedPath = RoundedRectangle(cornerRadius: squareWidth / 6)
                        .path(in: CGRect(x: xOffset, y: yOffset,
                                         width: squareWidth,
                                         height: squareWidth)).cgPath
                    
                    Path(rectanglePath.subtracting(roundedPath))
                        .fill(.ultraThinMaterial)
                    
                    RoundedRectangle(cornerRadius: squareWidth / 6)
                        .stroke(.blue, style: .init(lineWidth: 3))
                        .offset(x: xOffset, y: yOffset)
                        .frame(width: squareWidth, height: squareWidth)
                    
                    let animatingSquareWidth = squareWidth * (isExpanding ? 1.5 : 1)
                    
                    RoundedRectangle(cornerRadius: animatingSquareWidth / 6)
                        .stroke(.blue.opacity(0.5), style: .init(lineWidth: 3))
                        .offset(x: (reader.size.width - animatingSquareWidth) / 2,
                                y: 64 - (animatingSquareWidth - squareWidth) / 2)
                        .frame(width: animatingSquareWidth, height: animatingSquareWidth)
                        .opacity(isExpanding ? 0 : 1)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 8)
                        .offset(y: isScanningDown ? yOffset : yOffset + squareWidth)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                withAnimation {
                    isPresented = true
                }
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    isScanningDown.toggle()
                }
                withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                    isExpanding.toggle()
                }
            }
        }
    }
}

struct QRCodeScanner: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<QRCodeScanner>) -> UIViewController {
        // Create a QR code scanner
        let scannerViewController = QRCodeScannerViewController()
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<QRCodeScanner>) {
        // Update the view controller
    }
}

class QRCodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // Set up the camera and capture session
    
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        // Set up the capture session
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let input = try? AVCaptureDeviceInput(device: captureDevice!)
        captureSession.addInput(input!)
        
        // Set up the metadata output
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        // Start the capture session
        videoPreviewLayer.frame = view.layer.bounds
        videoPreviewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .background).async { [self] in
            captureSession.startRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadata object contains a QR code
        if metadataObjects.count == 0 {
            return
        }
        
        // Get the first metadata object
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        // Check if the QR code contains a valid URL
        if metadataObj.type == AVMetadataObject.ObjectType.qr, 
            let stringValue = metadataObj.stringValue {
            print(stringValue)
        }
    }
}
