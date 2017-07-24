//
//  ViewController.swift
//  FiltroTable
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableItems: UITableView!
    
    //mudar array de String pra uma classe com String, Bool pra controlar se esse item estará selecionado quando der ver mais?
    var items = [[String]]()
    var allSelected = [Bool]()
    var moreItems = -1
    var indexes = [IndexPath]()
    var log = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items.append(self.mulheres)
        self.items.append(self.rapazes)
        self.items.append(self.etcetal)
        self.items.append(self.infoeeletro)
        self.items.append(self.casa)
        self.allSelected.append(false)
        self.allSelected.append(false)
        self.allSelected.append(false)
        self.allSelected.append(false)
        self.allSelected.append(false)
    }
    
    let mulheres = [ "tênis", "blusas", "camisetas", "casaquinhos", "ombro", "short", "calças", "mochila", "relógios", "vestidos", "de mão", "camisas", "chapeu", "saias", "sandálias", "sapatos", "sapatilha", "óculos", "macacão", "perfume", "rasteirinha", "coletes", "clutches", "botas", "cintos", "cabelos", "carteiras", "meia-calça", "bijoux", "cosméticos", "maquiagem", "necessaire", "ternos", "vestidos de festa", "esportes", "outros", "praia", "lingerie"]
    
    let rapazes = [ "tênis", "camisetas", "camisas", "casacos", "bonés", "bermudas", "calças", "relógios", "bolsas", "sandálias", "óculos", "sapatos", "perfumes", "blazer", "lenços", "botas", "carteiras", "chapeu", "coletes", "esportes", "outros", "praia", "kids", "pezinho de menino", "roupas de menino", "roupas de menina", "pezinho de menina", "pezinho de bebê", "roupas de bebê", "brinquedos de crescidinhos", "outros"]
    
    let etcetal = [ "outros", "esportes e outdoor", "malas", "vintage e retrô", "pets"]
    
    let infoeeletro = [ "outros", "iphone", "outros", "outros celulares", "outros"]
    
    let casa = [ "decoração"]
    
    @IBAction func logButton(_ sender: Any) {
        print(log)
    }
    
    func headerTouched(sender: HeaderTapGestureRecognizer) {
        
        for item in 0...self.items[sender.index!].count {
            let indexPath = IndexPath(item: item, section: sender.index!)
            if self.allSelected[sender.index!] == false {
                if (self.tableItems.cellForRow(at: indexPath) as? ViewMoreUITableViewCell) == nil {
                    self.tableItems.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                }
            } else {
                self.tableItems.deselectRow(at: indexPath, animated: false)
            }
        }
        self.allSelected[sender.index!] = !self.allSelected[sender.index!]
    }
    
    // MARK: DATA SOURCE METHODS
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderUITableViewCell.instanceNib) as! HeaderUITableViewCell
        
        var element = ""
        
        switch section {
        case 0:
            element = "mulheres"
            
        case 1:
            element = "rapazes"
            
        case 2:
            element = "etcetal"
            
        case 3:
            element = "infoeeletro"
            
        case 4:
            element = "casa"
            
        default:
            break
        }
        
        let onTouchRecognizer = HeaderTapGestureRecognizer.init(target: self, action: #selector(self.headerTouched(sender:)))
        onTouchRecognizer.index = section
        cell.addGestureRecognizer(onTouchRecognizer)
        
        cell.config(headerText: element)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moreItems >= 0 && section == moreItems || self.items[section].count < 3 {
            return self.items[section].count
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if moreItems != indexPath.section && indexPath.item == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ViewMoreUITableViewCell.instanceNib) as! ViewMoreUITableViewCell
            tableView.deselectRow(at: indexPath, animated: false) //dando bug
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as! RegularUITableViewCell
            
            let element = self.items[indexPath.section][indexPath.item]
            
            cell.config(contentText: element)
            return cell
        }
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView.cellForRow(at: indexPath) as? RegularUITableViewCell) != nil {
            //todo
        } else if (tableView.cellForRow(at: indexPath) as? ViewMoreUITableViewCell) != nil {
            moreItems = indexPath.section
            self.indexes = tableView.indexPathsForSelectedRows!
            tableView.reloadData()
            for index in self.indexes {
                if (tableView.cellForRow(at: index) as? ViewMoreUITableViewCell) == nil {
                    tableView.selectRow(at: index, animated: false, scrollPosition: .none)
                } else {
                    tableView.deselectRow(at: index, animated: false)
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let element = self.items[indexPath.section][indexPath.item]
        
        log += "deselecionou \(element)\n"
    }
}

