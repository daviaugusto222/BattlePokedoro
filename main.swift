import Glibc
//função generica para atacar
func atacar(_ atacante: Pokemon, _ defendendo: Pokemon) -> Int{
  let dano = defendendo.defesa - atacante.ataque
  if dano < 0 {
    defendendo.vida = defendendo.vida + dano
  } else {
    atacante.vida -= dano
  }
  return dano
}

//função generica para defesa
func defender(_ atacante: Pokemon, _ defendendo: Pokemon){
  let dano = defendendo.defesa - atacante.ataque
  atacante.vida -= (dano)
}

//Turno do treinador dentro da batalha
func turnoTreinador(_ atacante: Pokemon, _ defendendo: Pokemon){
  print("Selecione sua ação:")
  print("1- Atacar")
  print("2- Defender")
  if let input = readLine()
  {
    if let int = Int(input)
    {
      switch int{
        case 1:
          print("------ Você atacou! ------")
          let dano = atacar(atacante, defendendo)
          if dano < 0 {
            print("   \(atacante.nome) atacou \(defendendo.nome)")
            print("   \(defendendo.nome) perdeu \(dano) de vida. Vida atual: \(defendendo.vida)")
          }else{
            print("   Ah não! \(defendendo.nome) tem muita defesa!")
            print("   \(atacante.nome) perdeu \(dano) de vida. Vida atual: \(atacante.vida)")
          }
        case 2:
          print("------ Você defendeu! ------")
          defender(atacante, defendendo)
          print("Você não vai receber dano!")
        default:
          print("Opção inválida.")
      }
        
    }
    else{
        print("Entrada invalida")
    }
  }
}

//Turno do PC dentro da batalha
func turnoPC(_ atacante: Pokemon, _ defendendo: Pokemon){
  print("------ Procrasty atacou! ------")
  let dano = atacar(atacante, defendendo)
  if dano < 1 {
    print("   \(atacante.nome) atacou \(defendendo.nome)")
    print("   \(defendendo.nome) perdeu \(dano) de vida. Vida atual: \(defendendo.vida)")
  }else{
    print("   Ah não! \(defendendo.nome) tem muita defesa!")
    print("   \(atacante.nome) perdeu \(dano) de vida. Vida atual: \(atacante.vida)")
  }
}

//retorna pokemon aleatório para o pc
func pokemonPC() -> Pokemon{
  let pokemons = [instamon, facemon, twitmon, preguicamon]
  let number = Int.random(in: 0 ... pokemons.count-1)
  return pokemons[number]
}


//Função de batalhar do menu principal
func batalhar(treinador: Treinador){
  var pokeTreinador: Pokemon = pokemonPC()
  let pokePC: Pokemon = pokemonPC()
  print("Selecione seu Pokémon:")

  for (index, pokemon) in treinador.pokemons.enumerated() {
    print("\(index):\(pokemon.nome)")
  }
  var aux = true
  while (aux){
    if let input = readLine()
    {
      if let int = Int(input)
      {
        pokeTreinador = treinador.pokemons[int]
        print("Você escolheu \(pokeTreinador.nome)!")
        aux = false
      }
      else{
          print("Entrada invalida")
      }
    }
  }

  //loop da batalha
  var e = true
  while(e){
    turnoTreinador(pokeTreinador, pokePC)
    e = verificaMorte(pokeTreinador, pokePC)

    turnoPC(pokePC, pokeTreinador)
    e = verificaMorte(pokePC, pokeTreinador)
  }
}

//Função que verifica morte dos pokemons
func verificaMorte(_ atacante: Pokemon, _ defendendo: Pokemon) -> Bool{
  if atacante.vida <= 0 {
    print("\(atacante.nome) foi derrotado!")
    print("Fim da batalha.")
    return false
  } 
  if defendendo.vida <= 0 {
    print("\(defendendo.nome) foi derrotado!")
    print("Fim da batalha.")
    return false
  }
  return true
}

//retorna pokemon aleatório para o luckyBox
func pokemonLB() -> Pokemon{
  let countPoke = pokemons.count
  if countPoke > 0 {
    let number = Int.random(in: 0 ... countPoke-1) 
    let poke = pokemons[number]
    pokemons.remove(at: number)
    return poke
  } else {
    return Pokemon(nome: "", num: 0, ataque: 0, defesa: 0, vida: 0)
  }
  
}
func luckyBox(_ treinador: Treinador){
  let box = """
..#####.....#####.....#####..
## -   ##.## +   ##.## .   ##
##  1  ##.##  2  ##.##  3  ##
##   . ##.##   . ##.##   ~ ##
..#####.....#####.....#####..     
"""
  
  var aux = true
  while (aux){
    print("Selecione um dos ovos:")    
    print(box)
    if let input = readLine()
    {
      if let int = Int(input)
      {
        switch int {
          case 1:
            let poke = pokemonLB()
            if poke.num != 0 {
              treinador.pokemons.append(poke)
              print("Parabéns! Você ganhou um \(poke.nome)!")
            } else {
              print("Os Pokémons de hoje acabaram!")
              
            }
            aux = false
          case 2: 
            let poke = pokemonLB()
            if poke.num != 0 {
              treinador.pokemons.append(poke)
              print("Parabéns! Você ganhou um \(poke.nome)!")
            } else {
              print("Os Pokémons de hoje acabaram!")
              
            }
            aux = false
          case 3: 
            let poke = pokemonLB()
            if poke.num != 0 {
              treinador.pokemons.append(poke)
              print("Parabéns! Você ganhou um \(poke.nome)!")
            } else {
              print("Os Pokémons de hoje acabaram!")
              
            }
            aux = false
          default:
            print("Opção não existe")
            aux = false
        }
      }
      else{
          print("Entrada invalida")
      }
    }
  }
}

//MAIN
func main(){
  let ashy = Treinador(nome: "Ash Cat1", classe: .Treinador, pokemons: [bulbassauro, squirtle, charmander])
  
  var aux = true
  while (aux){
    print("---- Battle Pokédoro ----")
    print("1- Batalhar")
    print("2- Lucky Egg")
    print("3- Exit")
    if let input = readLine()
    {
      if let int = Int(input)
      {
        switch int {
          case 1:
            system("clear")
            batalhar(treinador: ashy)
          case 2: 
            system("clear")
            luckyBox(ashy)
          case 3: 
            system("clear")
            print("Desligando...")
            aux = false
          default:
            print("Opção não existe")
        }
      }
      else{
          print("Entrada invalida")
      }
    }
  }
}
main()