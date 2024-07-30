//
//  ViewController.swift
//  HesapMakinesi-Odev
//
//  Created by İbrahim Cem Ekti on 30.07.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelSonuc: UILabel!
    
     var firstNumber: Int?
     var secondNumber: Int?
     var mevcutIslem: String?
     var ikinciSayiHazirlik = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tumuTemizle()
    }
    
    func tumuTemizle(){
        firstNumber = nil
        secondNumber = nil
        mevcutIslem = nil
        ikinciSayiHazirlik = false
        labelSonuc.text = ""
    }
    
    func sayiBastir(number:Int){
        // Ekranda gösterilecek yeni metin
              let newText = (labelSonuc.text ?? "") + "\(number)"
              labelSonuc.text = newText

              // Eğer ikinci sayıya giriliyorsa, secondNumber değişkenini güncelle
              if ikinciSayiHazirlik {
                  secondNumber = Int(newText)
              } else {
                  // Eğer ilk sayıya giriliyorsa, firstNumber değişkenini güncelle
                  firstNumber = Int(newText)
              }
    }
    
    func islemSec(islem: String){
        mevcutIslem = islem
        ikinciSayiHazirlik = true
        labelSonuc.text = ""
    }
    
    @IBAction func buttonTümSil(_ sender: UIButton) {
        tumuTemizle()
    }
    
    @IBAction func buttonTekSil(_ sender: UIButton) {
        labelSonuc.text?.removeLast()
    }
    
    @IBAction func buttonYuzde(_ sender: UIButton) {
        islemSec(islem: "%")
    }
    
    @IBAction func buttonBolme(_ sender: UIButton) {
        islemSec(islem: "/")
    }
    
    @IBAction func buttonCarpma(_ sender: UIButton) {
        islemSec(islem: "*")
    }
    
    @IBAction func buttonEksi(_ sender: UIButton) {
        islemSec(islem: "-")
    }
    
    @IBAction func buttonToplama(_ sender: UIButton) {
        islemSec(islem: "+")
    }
    
    @IBAction func buttonEsittir(_ sender: UIButton) {
      
        // İşlem yapılacak değişkenlerin kontrolü
                guard let first = firstNumber, let second = secondNumber, let operation = mevcutIslem else {
                    labelSonuc.text = "Error" // Hatalı işlem durumunda hata mesajı
                    return
                }
                
                var result: Double? // Sonucu saklayacağımız değişken

                // Seçilen işleme göre hesaplama yapıyoruz
                switch operation {
                case "+":
                    result = Double(first + second)
                case "-":
                    result = Double(first - second)
                case "*":
                    result = Double(first * second)
                case "/":
                    if second != 0 {
                        result = Double(first) / Double(second)
                    } else {
                        labelSonuc.text = "Error" // Sıfıra bölme hatası
                        return
                    }
                case "%":
                    result = Double(first) * Double(second) / 100
                default:
                    labelSonuc.text = "Error" // Geçersiz işlem durumu
                    return
                }
                
                // Sonucu ekranda göster
                if let result = result {
                    labelSonuc.text = String(format: "%.2f", result) // Sonucu 2 ondalıklı basamağa yuvarlayarak göster
                } else {
                    labelSonuc.text = "Error"
                }
                
                // Hesaplamadan sonra değişkenleri sıfırla
                firstNumber = nil
                secondNumber = nil
                mevcutIslem = nil
                ikinciSayiHazirlik = false
            }
            
    
    @IBAction func buttonNokta(_ sender: UIButton) {
    }
    
    @IBAction func buttonYedi(_ sender: UIButton) {
        sayiBastir(number: 7)
    }
    
    @IBAction func buttonSekiz(_ sender: UIButton) {
        sayiBastir(number: 8)
    }
    
    @IBAction func buttonDokuz(_ sender: UIButton) {
        sayiBastir(number: 9)
    }
    
    @IBAction func buttonDort(_ sender: UIButton) {
        sayiBastir(number: 4)
    }
    
    @IBAction func buttonBes(_ sender: UIButton) {
        sayiBastir(number: 5)
    }
    
    @IBAction func buttonAlti(_ sender: UIButton) {
        sayiBastir(number: 6)
    }
    
    @IBAction func buttonBir(_ sender: UIButton) {
        sayiBastir(number: 1)
        
    }
    
    @IBAction func butttonIki(_ sender: UIButton) {
        sayiBastir(number: 2)
    }
    
    @IBAction func buttonUc(_ sender: UIButton) {
        sayiBastir(number: 3)
    }
    
    @IBAction func buttonSifir(_ sender: UIButton) {
        sayiBastir(number: 0)
    }
    
    
    
    
}
