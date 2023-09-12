//
//  ViewController.swift
//  Sayaclar
//
//  Created by Ali serkan Boyracı  on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var zamanLabel: UILabel!
    
    var timer = Timer()
    var kalanZaman = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kalanZaman = 15
        zamanLabel.text = "Zaman: \(kalanZaman)"
    }

    @IBAction func baslatTiklandi(_ sender: Any) {
        //scheduled yaparak, fonk. ekleyip- timeInterval= kaç saniyede bir çalışması,
        //target = self, VC de çalışsın.
        //selector= istedğimi fonk. tanımlayacağız.
        // userInfo = kullanıcı bilgisi ile yapılması istenen herhangi birşey
        // repeats = tekrar etsin mi
        zamanLabel.text = "Zaman: \(kalanZaman)"

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zamanlamaFonk), userInfo: nil, repeats: true)
        // baslat tiklandiktan sonra tusu inaktif durumu getirmemiz gerekiyor. her bastiginda tekrar komut gidiyor ve sayac daha hizli calisiyor.
    }
    
    @objc func zamanlamaFonk () {
        kalanZaman -=  1
        zamanLabel.text = "Zaman: \(kalanZaman)"
        
        if kalanZaman == 0 {
            zamanLabel.text = "Süre Bitti!"
            timer.invalidate()
            kalanZaman = 15
        }
        
        
        
        
    }
}

