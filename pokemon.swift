class Pokemon{
  let nome: String
  let num: Int
  let ataque: Int
  let defesa: Int
  var vida: Int

  init(nome: String, num: Int, ataque: Int, defesa: Int, vida: Int){
    self.nome = nome
    self.num = num
    self.ataque = ataque
    self.defesa = defesa
    self.vida = vida
  }
}

var pokemons = [ivysaur, venusaur, charmeleon, charizard, wartortle, blastoise]

let bulbassauro = Pokemon(nome: "Bulbassauro", num: 1, ataque: 10, defesa: 7, vida: 14)
let charmander = Pokemon(nome: "Charmander", num: 4, ataque: 12, defesa: 8, vida: 11)
let squirtle = Pokemon(nome: "Squirtle", num: 7, ataque: 14, defesa: 10, vida: 12)

let ivysaur = Pokemon(nome: "Ivysaur", num: 2, ataque: 11, defesa: 8, vida: 15)
let venusaur = Pokemon(nome: "Venusaur", num: 3, ataque: 12, defesa: 9, vida: 16)
let charmeleon = Pokemon(nome: "Charmeleon", num: 5, ataque: 13, defesa: 9, vida: 12)
let charizard = Pokemon(nome: "Charizard", num: 5, ataque: 14, defesa: 10, vida: 13)
let wartortle = Pokemon(nome: "Wartortle", num: 5, ataque: 15, defesa: 10, vida: 14)
let blastoise = Pokemon(nome: "Blastoise", num: 5, ataque: 16, defesa: 12, vida: 12)


let instamon = Pokemon(nome: "Instamon", num: 1, ataque: 10, defesa: 7, vida: 14)
let twitmon = Pokemon(nome: "Twitmon", num: 7, ataque: 12, defesa: 8, vida: 11)
let facemon = Pokemon(nome: "Facemon", num: 5, ataque: 14, defesa: 10, vida: 12)
let preguicamon = Pokemon(nome: "Preguiçamon", num: 5, ataque: 9, defesa: 10, vida: 16)