//
//  ViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-11-12.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit
import AVKit
import Vision

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var currentIdentifier = ""
    
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here is where we start the camera
        let captureSession = AVCaptureSession()
        
        //captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        guard let captureDevice =
            AVCaptureDevice.default(for: .video) else { return }
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame

        
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(screenTapped(_:)))
        view.addGestureRecognizer(screenTap)
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue:
            DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        setupIdentifierConfidenceLabel()
        
//        let glossBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
//        glossBtn.setImage(#imageLiteral(resourceName: "More 1"), for: .normal)
//        glossBtn.translatesAutoresizingMaskIntoConstraints = false
//        glossBtn.addTarget(self, action: #selector(glossAction), for: .touchUpInside)
//        self.view.addSubview(glossBtn)
        
        let glossBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 800, width: 100, height: 50))
        glossBtn.setImage(#imageLiteral(resourceName: "Asset 1-11"), for: .normal)
        glossBtn.addTarget(self, action: #selector(glossAction), for: .touchUpInside)
        glossBtn.translatesAutoresizingMaskIntoConstraints = false
        glossBtn.tag = 2
        self.view.addSubview(glossBtn)
        
        let moreBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 800, width: 100, height: 50))
        moreBtn.setImage(#imageLiteral(resourceName: "Asset 1"), for: .normal)
        moreBtn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        moreBtn.translatesAutoresizingMaskIntoConstraints = false
        moreBtn.tag = 3
        self.view.addSubview(moreBtn)
        
//        glossBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        glossBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
//        glossBtn.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        glossBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        glossBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24).isActive = true
        glossBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        glossBtn.heightAnchor.constraint(equalToConstant: 75).isActive = true
        glossBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        moreBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24).isActive = true
        moreBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        moreBtn.heightAnchor.constraint(equalToConstant: 75).isActive = true
        moreBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
    }
    
    @objc func glossAction() {
        navigationController?.pushViewController(GlossaryController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
    
    @objc func moreAction() {
        navigationController?.pushViewController(MoreGlossaryController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }

    
    var clicked = true
    
    @objc func screenTapped(_ sender:UITapGestureRecognizer){
        print ("go to page for \(identifierLabel.text)")
        if currentIdentifier == "Morel"{
            let newVc = MorelViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        if currentIdentifier == "Dandelion"{
            let newVc = DandelionViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        if currentIdentifier == "Echinacea"{
            let newVc = EchinaceaViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        if currentIdentifier == "Death Cap"{
            let newVc = DeathCapViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        if currentIdentifier == "Chanterelle"{
            let newVc = ChanterelleViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        if currentIdentifier == "Brown Button"{
            let newVc = BrownButtonViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }

    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -555).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
       
        
        guard let pixelBuffer: CVPixelBuffer =
            CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        guard let model = try? VNCoreMLModel(for: ImageClassifier8().model) else { return }
        
        let request = VNCoreMLRequest(model: model )
        { (finishedReq, err ) in
            
            // check error
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else
                { return }
            
            self.currentIdentifier = firstObservation.identifier
            
            print(firstObservation.identifier,
                   firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.identifierLabel.text = "We Think This Is \(firstObservation.identifier), Click On It To Learn More."
                self.identifierLabel.font = UIFont.boldSystemFont(ofSize: 14)
//                self.identifierLabel.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
                
                let safeImageView = UIImageView(frame: CGRect(x: 115, y: 300, width: 200, height: 200))
                let safeImage = UIImage(named: "safe.png")
                safeImageView.image = safeImage
                
                let dangerImageView = UIImageView(frame: CGRect(x: 115, y: 300, width: 200, height: 200))
                let dangerImage = UIImage(named: "danger.png")
                dangerImageView.image = dangerImage
                
                let clearImageView = UIImageView(frame: CGRect(x: 115, y: 300, width: 200, height: 200))
                let clearImage = UIImage(named: "clear.png")
                clearImageView.image = clearImage

//                if self.currentIdentifier == "Morel" || self.currentIdentifier == "Brown Button" || self.currentIdentifier == "Chanterelle" || self.currentIdentifier == "Dandelion" || self.currentIdentifier == "Echinacea" {
//                    self.view.addSubview(safeImageView)
//                } else {
//                    safeImageView.removeFromSuperview()
//                }
//
//                if self.currentIdentifier == "White Button" {
//                    self.view.addSubview(dangerImageView)
//                } else {
//                    dangerImageView.removeFromSuperview()
//                }
//
                if self.currentIdentifier != "Morel" &&
                   self.currentIdentifier != "Dandelion" &&
                   self.currentIdentifier != "Echinacea" &&
                   self.currentIdentifier != "Brown Button" &&
                   self.currentIdentifier != "Chanterelle" &&
                   self.currentIdentifier != "Death Cap"{
                   self.identifierLabel.text = "Searching..."
                }

        }
            
            
        }
        
        
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options:
            [:]).perform([request])
    }

}

