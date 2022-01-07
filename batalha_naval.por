programa {
	inclua biblioteca Util
	inteiro pontuacao = 0
	
	funcao inicializaTabuleiro(cadeia tabuleiro[][]) {
		inteiro i=0, j=0
		
		para(i=0; i<9; i++) {
		    para(j=0; j<9; j++) {
		    	tabuleiro[i][j] = " _ "
		    }
		}
	}

	funcao exibirTabuleiro(cadeia tabuleiro[][], caracter letras_colunas[]) {
		
		inicializaLetrasColunas(letras_colunas) // Preenchendo as colunas com as letras de A a I para demarcação
		inteiro i=0, j=0
		
		para(i=0; i<9; i++) {
		    escreva(i+1," ")
		    para(j=0; j<10; j++) {
		     escreva(tabuleiro[i][j])
		    }
		    escreva("\n\n")
		}
	}

	funcao inicializaLetrasColunas(caracter letras[]) {
		inteiro i=0, j=0
		
		para(i=0; i<10; i++) {
			se(i==0) {
				escreva("   ")
			} senao {
				escreva(letras[i-1],"  ")
			}
		}
		escreva("\n\n")
	}

	funcao tipoJogador(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][]) {
		inteiro opcao=0 // opção para o tipo de jogador

		// Laço para garantir que o usuário vai escolher uma opção válida para o tipo de jogador
		faca {
			escreva("Informe em qual tabuleiro deseja inserir os navios. Digite 1 para o 'jogador principal' ou 2 para a 'máquina': \n")
			leia(opcao)
		} enquanto(opcao != 1 e opcao != 2)

		se(opcao == 1) { // verifica se o tipo de jogador é uma pessoa
			tiposDeNavios(tabuleiro_jogador)
		}
		se(opcao == 2) { // verifica se o tipo de jogador é uma máquina
			tiposDeNavios(tabuleiro_maquina)
		}
	}

	// função que escolhe os tipos de navios para inserção no tabuleiro do jogador principal ou da máquina
	funcao tiposDeNavios(cadeia &tabuleiro_objeto[][]) {
		inteiro opcaoNavio = 0, linha = 0, coluna = 0, posicoes = 0
		cadeia tipo = ""
		
		escreva("Tipos de navios disponíveis\n")
		escreva("Porta Aviões ( P ) --> Digite 1\n")
		escreva("Navio Tanque --> ( T ) --> Digite 2\n")
		escreva("Contratorpedeiros ( C ) --> Digite 3\n")
		escreva("Submarino --> ( S ) --> Digite 4\n\n")

		leia(opcaoNavio)

		se(opcaoNavio == 1) {
			posicoes = 5
			tipo = " P "
			
			escreva("Em qual linha você deseja inserir o navio porta aviões?\n")
			leia(linha)
			escreva("Em qual coluna você deseja inserir o navio porta aviões?\n")
			leia(coluna)
			alteraTabuleiroComNavios(tabuleiro_objeto, linha, coluna, posicoes, tipo)
		}
		senao se(opcaoNavio == 2) {
			posicoes = 4
			tipo = " T "
			
			escreva("Em qual linha você deseja inserir o navio porta aviões?\n")
			leia(linha)
			escreva("Em qual coluna você deseja inserir o navio porta aviões?\n")
			leia(coluna)
			alteraTabuleiroComNavios(tabuleiro_objeto, linha, coluna, posicoes, tipo)
		}
		senao se(opcaoNavio == 3) {
			posicoes = 3
			tipo = " C "
			
			escreva("Em qual linha você deseja inserir o navio porta aviões?\n")
			leia(linha)
			escreva("Em qual coluna você deseja inserir o navio porta aviões?\n")
			leia(coluna)
			alteraTabuleiroComNavios(tabuleiro_objeto, linha, coluna, posicoes, tipo)
		}
		senao se(opcaoNavio == 4) {
			posicoes = 2
			tipo = " S "
			
			escreva("Em qual linha você deseja inserir o navio porta aviões?\n")
			leia(linha)
			escreva("Em qual coluna você deseja inserir o navio porta aviões?\n")
			leia(coluna)

			alteraTabuleiroComNavios(tabuleiro_objeto, linha, coluna, posicoes, tipo)
		}
	}

	// função para alterar o tabuleiro e colocar o navio na posição específica
	funcao alteraTabuleiroComNavios(cadeia &tabuleiro[][], inteiro linha, inteiro coluna, inteiro posicoes, cadeia tipo) {
		inteiro i=0, j=0, k=0, l=0 // variáveis de controle para incremento. A variável l serve para receber o valor da coluna passada por parâmetro e incrementar até preencher o navio por completo
		caracter letras_colunas[9] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'} // Inicializa o array com os rótulos das colunas
		
		para(i=0; i<9; i++) {
		    para(j=0; j<9; j++) {
		    	se(linha == i e coluna == j) { // Verifica se a linha e a coluna são as que foram passadas por parâmetro para a função
		    		l = coluna // a variável l recebe o valor da variável coluna para incrementar dentro do próximo laço e preencher com o navio nas colunas corretas
		    		para(k=0; k < posicoes; k++) {
		    			tabuleiro[linha-1][l] = "" // zera o valor original do tabuleiro
		    			tabuleiro[linha-1][l] = tipo // substítui pelo valor do navio

		    			l++
		    		}
		    	} senao {
		    		tabuleiro[i][j] = " _ "
		    	}
		    }
		}

		exibirTabuleiro(tabuleiro, letras_colunas)
	}
	
	funcao inicio() {
		cadeia tabuleiro 
		cadeia tabuleiro_barco_jogador[9][10]
		cadeia tabuleiro_bomba_jogador[9][10]
		cadeia tabuleiro_barco_maquina[9][10]
		cadeia tabuleiro_bomba_maquina[9][10]

		caracter tiposBarcos
		
		caracter letras_colunas[9] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'}

		escreva("  ++++++++ BATALHA NAVAL ++++++++\n\n\n\n")

		inicializaTabuleiro(tabuleiro_barco_jogador) // Inicializa o tabuleiro do jogador
		inicializaTabuleiro(tabuleiro_barco_maquina) // Inicializa o tabuleiro da máquina
		
		exibirTabuleiro(tabuleiro_barco_jogador, letras_colunas) // Exibindo o tabuleiro preenchido
		escreva("\n\n")
		exibirTabuleiro(tabuleiro_barco_maquina, letras_colunas) // Exibindo o tabuleiro preenchido
		
		tipoJogador(tabuleiro_barco_jogador, tabuleiro_barco_maquina)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 57; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */