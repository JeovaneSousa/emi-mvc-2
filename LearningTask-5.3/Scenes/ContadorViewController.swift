//
//  ViewController.swift
//  LearningTask-5.3
//
//  Created by rafael.rollo on 12/03/2022.
//

import UIKit

class ContadorViewController: UIViewController {
    

    @IBOutlet weak var contadorAtualLabel: UILabel!
    @IBOutlet weak var padraoDeIncrementoLabel: UILabel!
    @IBOutlet weak var valorStepper: UIStepper!
    
    var valorAntigo = 0
    var novoValor = 0
    let arrayOfColors:[UIColor] = [.brown, .darkGray, .lightGray, .purple, .cyan, .magenta, .tertiaryLabel, .tintColor]
    
    var contador: Contador? {
        willSet{
            guard let contador = contador, isViewLoaded else{return}
            valorAntigo = contador.valorAtual
        }
        didSet{
            guard let contador = contador, isViewLoaded else {return}
            novoValor = contador.valorAtual
            mudaBackgroundSeNecessario(comparando: valorAntigo, com: novoValor)
            atualizaView(para: contador)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contador = contador else{return}
        atualizaView(para: contador)
        // Do any additional setup after loading the view.
    }

    
    func atualizaView(para contador: Contador){
        contadorAtualLabel.text = String(contador.valorAtual)
        padraoDeIncrementoLabel.text = String(contador.incrementoDeValor)
    }
    
    func mudaBackgroundSeNecessario(comparando valorAntigo: Int, com novoValor: Int){
        guard (valorAntigo >= 0 && novoValor < 0) else {return}
        self.view.backgroundColor = arrayOfColors.randomElement()
    }
    
    @IBAction func aumentarButtonPressed(_ sender: UIButton) {
        contador?.incrementa()
    }
    
    
    @IBAction func diminuirButtonPressed(_ sender: UIButton) {
        contador?.decrementa()
    }
    
    @IBAction func valorStepperChanged(_ sender: UIStepper) {
        let valor = Int(sender.value)
        let valorAtual = contador?.valorAtual
        self.contador = Contador(valorAtual: valorAtual!, incrementoDeValor: valor)
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        contador?.reset()
        valorStepper.value = 0
    }
    
    
}

