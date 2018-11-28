//
//  PokedexViewController.swift
//  PokemonGo
//
//  Created by Yanela Pachacama Quispe on 21/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
   var pokemonsAtrapados : [Pokemon] = []
    var pokemonsNoAtrapados : [Pokemon] = []
  
    var pokemons : [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       pokemonsAtrapados = obtenerPokemonsAtrapados()
       pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func mapTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return pokemonsAtrapados.count
        } else {
            return pokemonsNoAtrapados.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon : Pokemon
        if indexPath.section == 0 {
            pokemon = pokemonsAtrapados[indexPath.row]
        }else{
            pokemon = pokemonsNoAtrapados[indexPath.row]
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.nombre
        cell.imageView?.image = UIImage(named: pokemon.imagenNombre!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0{
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Atrapados"
        } else {
            return "No Atrapados"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
                if editingStyle == .delete{
                    let pokemon = pokemonsAtrapados[indexPath.row]
                    pokemon.atrapado = false
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    //pokemonsAtrapados.remove(at: indexPath.row)
                    //tableView.deleteRows(at: [indexPath], with: .fade)
                    pokemonsAtrapados = obtenerPokemonsAtrapados()
                    pokemonsNoAtrapados = obtenerPokemonsNoAtrapados()
                    tableView.reloadData()
                }else{
                   
        }
        
        
    }
    
}
