def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                            "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao     "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação! "
    puts "  |' '  |  |_|  |'  ' |                         "
    puts "  |_____| ' _ ' |_____|                         " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Vamos iniciar o jogo para você, #{nome}" 
    return nome
end

def pede_dificuldade
    puts "Qual o nivel da dificuldade ?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "    
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1 
        maximo = 30
    when 2 
        maximo = 60 
    when 3 
        maximo = 100 
    when 4 
        maximo = 150 
    else
        maximo = 200 
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "Escolhido.. que tal adivinhar hoje nosso número secreto?"
    return sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "\n\n\n\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}" 
    puts "Chutes até agora: #{chutes}" 
    puts "Entra com o numero..."
    chute = gets.strip
    puts "Será que acertou ? Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(tentativa, limite_de_tentativas, numero_secreto, chute)
    if numero_secreto == chute.to_i
        ganhou
        return true
    else
        puts "Errou!"
        
        maior = numero_secreto > chute.to_i
        if maior
            puts "O número secreto é maior!"
        else 
            puts "O número secreto é menor!"
        end
        if tentativa == limite_de_tentativas
            puts "O número secreto era #{numero_secreto}"
        end
    end
    return false
end

def ganhou 
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def mostra_pontos(pontos)
    puts "Você esta com #{pontos} pontos."
end

def mostra_pontos_final(pontos)
    puts "Você ganhou #{pontos} pontos."
end

def joga(nome,dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []

    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        chutes << chute

        if nome.downcase == "gustavo"
            ganhou
            break
        end

        if verifica_se_acertou(tentativa, limite_de_tentativas,numero_secreto, chute)
            mostra_pontos_final(pontos_ate_agora)
            break
        end
        pontos_ate_perder = 200
        pontos_ate_agora -= pontos_ate_perder
        mostra_pontos(pontos_ate_agora)
    end
end


def quer_jogar
    puts "Deseja jogar novamente ? (S/N) "
    quero_jogar = gets.strip
    if quero_jogar.upcase == "S"
        puts "Vamos iniciar o jogo novamente!"
        return false
    elsif quero_jogar.upcase == "N"
        puts "O jogo acabou!"
        return true
    else 
        puts "Coloca (S) para sim ou (N) para não jogar novamente"
        quer_jogar
    end
end


nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do 
    joga nome, dificuldade
    if quer_jogar
        break
    end
end