//
//  ViewController.swift
//  WalmartPOC
//
//  Created by retina on 15/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuTable: UITableView!
    
    //mudar array de String pra uma classe com String, Bool pra controlar se esse item estará selecionado quando der ver mais?
    var items = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items.append(self.informacoes)
        self.items.append(self.demonstrativos)
        self.items.append(self.solicitacoes)
    }
    
    let informacoes = [ "Minhas informações", "Meus dependentes"]
    
    let demonstrativos = [ "Demonstrativo Mensal", "Demonstrativo Quinzenal", "Demonstrativo Bônus", "Demonstrativo 13º Salário", "Demonstrativo IRRF"]
    
    let solicitacoes = [ "Solicitação de Férias"]
    
    
    // MARK: DATA SOURCE METHODS
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderUITableViewCell.instanceNib) as! HeaderUITableViewCell
        
        var element = ""
        
        switch section {
        case 0:
            element = "Informações"
            
        case 1:
            element = "Demonstrativos"
            
        case 2:
            element = "Solicitações"
            
        default:
            break
        }
        
        cell.config(headerText: element.uppercased())
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as! RegularUITableViewCell
        
        let element = self.items[indexPath.section][indexPath.item]
        
        var cornerRule = -1
        if self.items[indexPath.section].count == 1 {
            cornerRule = 2
        } else if indexPath.item == 0 {
            cornerRule = 0
        } else if indexPath.item + 1 == self.items[indexPath.section].count {
            cornerRule = 1
        }
        cell.config(contentText: element, cornerRule: cornerRule)
        return cell
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //todo
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //todo

    }
    
    
}

