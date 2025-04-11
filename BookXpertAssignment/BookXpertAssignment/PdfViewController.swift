//
//  PdfViewController.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import UIKit
import PDFKit
import PDFReader

class PdfViewController: UIViewController {
    
    
    @IBOutlet weak var openPdfButton: UIButton!
    @IBOutlet weak var pdfLinkLabel: UILabel!
    
    private var pdfLink = "https://fssservices.bookxpert.co/GeneratedPDF/Companies/nadc/2024-2025/BalanceSheet.pdf"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfLinkLabel.text = pdfLink
        
    }
    
    @IBAction func openPdfButtonAction(_ sender: Any) {
        debugPrint("openPdfButtonAction called")
        guard let url = URL(string: pdfLink) else {
            print("Invalid PDF URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading PDF: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("BalanceSheet.pdf")
            do {
                try data.write(to: tempURL)
                
                DispatchQueue.main.async {
                    if let document = PDFReader.PDFDocument(url: tempURL) {
                        let readerVC = PDFViewController.createNew(with: document, title: "Balance Sheet")
                        
                        if let navController = self.navigationController {
                            navController.pushViewController(readerVC, animated: true)
                        } else {
                            self.present(readerVC, animated: true, completion: nil)
                        }
                    } else {
                        print("Failed to create PDFReader.PDFDocument from URL")
                    }
                }
            } catch {
                print("Failed to write PDF to file: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
