//
//  Funciones.swift
//  PokemonGo
//
//  Created by Yanela Pachacama Quispe on 21/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func agregarPokemons(){
    crearPokemon(xnombre : "Mew", ximagenNombre : "mew")
    crearPokemon(xnombre : "Meowth", ximagenNombre : "meowth")
    crearPokemon(xnombre : "Bullbasaur", ximagenNombre : "bullbasaur")
    crearPokemon(xnombre : "Charmander", ximagenNombre : "charmander")
    crearPokemon(xnombre : "Jigglypuff", ximagenNombre : "jigglypuff")
    crearPokemon(xnombre : "Mystic", ximagenNombre : "mystic")
    crearPokemon(xnombre : "Pikachu", ximagenNombre : "pikachu-2")
    crearPokemon(xnombre : "Psyduck", ximagenNombre : "psyduck")
    crearPokemon(xnombre : "Snorlax", ximagenNombre : "snorlax")
    crearPokemon(xnombre : "Squirtle", ximagenNombre : "squirtle")
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func crearPokemon(xnombre:String, ximagenNombre:String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context:context)
    pokemon.nombre = xnombre
    pokemon.imagenNombre = ximagenNombre
}

func obtenerPokemons() -> [Pokemon]{
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do{
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        if pokemons.count == 0 {
            agregarPokemons()
            return obtenerPokemons()
        }
        return pokemons
    } catch {}
    return[]
    
}

func obtenerPokemonsAtrapados() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", true as CVarArg)
    do{
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    } catch{}
    return []
}

func obtenerPokemonsNoAtrapados() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let queryConWhere = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    queryConWhere.predicate = NSPredicate(format: "atrapado == %@", false as CVarArg)
    do{
        let pokemons = try context.fetch(queryConWhere) as [Pokemon]
        return pokemons
    } catch{}
    return []
}

