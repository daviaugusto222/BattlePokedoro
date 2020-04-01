enum Classe{
  case Professor
  case Treinador
  case Lider
  case Estilista
  case Performer
  case Colecionador
}

class Treinador{
  let nome: String
  let classe:  Classe
  var pokemons: [Pokemon]

  init(nome: String, classe: Classe, pokemons: [Pokemon]){
    self.nome = nome
    self.classe = classe
    self.pokemons = pokemons
  }
}

