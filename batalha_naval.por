programa {
	inclua biblioteca Util
	inteiro pontuacao = 0, quantNaviosJogador=0, quantNaviosInimigo=0
	
	funcao inicializaTabuleiro(cadeia tabuleiro[][]) {
		inteiro i=0, j=0
		
		para(i=0; i<10; i++) {
		    para(j=0; j<10; j++) {
		    	tabuleiro[i][j] = "  _  "
		    }
		}
	}

	funcao exibirTabuleiro(cadeia tabuleiro_jogador[][], cadeia tabuleiro_maquina[][], caracter letras_colunas[]) {
		escreva("\t\tJogador\t\t\t\t\t						Máquina\n\n\n")
		inicializaLetrasColunas(letras_colunas) // Preenchendo as colunas com as letras de A a J para demarcação antes de iniciar a primeira linha do mapa
		escreva("\t\t\t\t")
		inicializaLetrasColunas(letras_colunas)
		escreva("\n\n")
		inteiro i=0, j=0
		
		para(i=0; i<10; i++) {
		    escreva(i+1," ")
		    para(j=0; j<10; j++) {
		     escreva(tabuleiro_jogador[i][j])
		    }
		    escreva("\t\t\t\t")
		    para(j=0; j<10; j++) {
		     escreva(tabuleiro_maquina[i][j])
		    }
		    escreva("\n\n")
		}
	}

	// Função que escreve as colunas demarcadas pelos caracteres de A a J e exibe na tela
	funcao inicializaLetrasColunas(caracter letras[]) {
		inteiro i=0, j=0
		
		para(i=0; i<11; i++) { // itera de 0 a 10 (11 posições) porque uma posição é utilizada para gerar o espaçamento entre as marcaççoes de linhas e colunas (letras e números)
			se(i==0) {
				escreva("   ")
			} senao {
				escreva(letras[i-1],"    ")
			}
		}
		//escreva("\n\n")
	}

	//funcao tipoJogador(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][]) {

			//tiposDeNavios(tabuleiro_jogador, tabuleiro_maquina)

	//}

	// função que escolhe os tipos de navios para inserção no tabuleiro do jogador principal ou da máquina
	funcao tiposDeNavios(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][]) {
		inteiro opcaoNavio = 0, posicoes = 0
		cadeia tipo = ""
		
		escreva("Tipos de navios disponíveis\n")
		escreva("Porta Aviões ( P ) --> Digite 1\n")
		escreva("Navio Tanque --> ( T ) --> Digite 2\n")
		escreva("Contratorpedeiros ( C ) --> Digite 3\n")
		escreva("Submarino --> ( S ) --> Digite 4\n\n")

		leia(opcaoNavio)

		se(opcaoNavio == 1) {
			posicoes = 5
			tipo = "  P  "
			
			
			alteraTabuleiroComNavios(tabuleiro_jogador, tabuleiro_maquina, posicoes, tipo)
		}
		senao se(opcaoNavio == 2) {
			posicoes = 4
			tipo = "  T  "
			
			
			alteraTabuleiroComNavios(tabuleiro_jogador, tabuleiro_maquina, posicoes, tipo)
		}
		senao se(opcaoNavio == 3) {
			posicoes = 3
			tipo = "  C  "
			
			
			alteraTabuleiroComNavios(tabuleiro_jogador, tabuleiro_maquina, posicoes, tipo)
		}
		senao se(opcaoNavio == 4) {
			posicoes = 2
			tipo = "  S  "
			
			

			alteraTabuleiroComNavios(tabuleiro_jogador, tabuleiro_maquina, posicoes, tipo)
		}
	}

	// função para alterar o tabuleiro e colocar o navio na posição específica
	funcao alteraTabuleiroComNavios(cadeia &tabuleiro[][], cadeia &tabuleiro2[][], inteiro posicoes, cadeia tipo) {
		inteiro i=0, j=0, k=0, l=0 // variáveis de controle para incremento. A variável l serve para receber o valor da coluna passada por parâmetro e incrementar até preencher o navio por completo
		caracter letras_colunas[10] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'} // Inicializa o array com os rótulos das colunas
		inteiro linhaJogador = Util.sorteia(0, 9), colunaJogador = Util.sorteia(0, 9), linhaInimigo = Util.sorteia(0, 9), colunaInimigo = Util.sorteia(0, 9)

		para(i=0; i<10; i++) {
		    para(j=0; j<10; j++) {
		    	se(linhaJogador == i e colunaJogador == j) { // Verifica se a linha e a coluna são as que foram passadas por parâmetro para a função
		    		l = colunaJogador // a variável l recebe o valor da variável coluna para incrementar dentro do próximo laço e preencher com o navio nas colunas corretas
		    		para(k=0; k < posicoes; k++) {
		    			tabuleiro[linhaJogador][l] = "" // zera o valor original do tabuleiro
		    			tabuleiro[linhaJogador][l] = tipo // substítui pelo valor do navio

		    			l++
		    		}
		    	} senao {
		    		tabuleiro[i][j] = "  _  "
		    	}
		    }

			l=0
			escreva("\t")
			
		    // mapa do inimigo
		    para(j=0; j<10; j++) {
		    	se(linhaInimigo == i e colunaInimigo == j) { // Verifica se a linha e a coluna são as que foram passadas por parâmetro para a função
		    		l = colunaInimigo // a variável l recebe o valor da variável coluna para incrementar dentro do próximo laço e preencher com o navio nas colunas corretas
		    		para(k=0; k < posicoes; k++) {
		    			tabuleiro2[linhaInimigo][l] = "" // zera o valor original do tabuleiro
		    			tabuleiro2[linhaInimigo][l] = tipo // substítui pelo valor do navio

		    			l++
		    		}
		    	} senao {
		    		tabuleiro[i][j] = "  _  "
		    	}
		    }
		}

		faca {
			inteiro linha=0, coluna=0
			
			exibirTabuleiro(tabuleiro, tabuleiro2, letras_colunas)
			disparar(tabuleiro, tabuleiro2, linha, coluna)
		} enquanto(quantNaviosJogador != 0 ou quantNaviosInimigo != 0) // os navios forem diferentes de zero
	}

	funcao disparar(cadeia &tabuleiro[][], cadeia &tabuleiro2[][], inteiro linha, inteiro coluna) {
		
	}
	
	funcao inicio() {
		cadeia tabuleiro 
		cadeia tabuleiro_jogador[10][11] // coluna com 11 posições devido a uma posição ser utilizada para espaço entre marcadores de linhas e colunas (números e letras)
		cadeia tabuleiro_bomba_jogador[10][11]
		cadeia tabuleiro_maquina[10][11]
		cadeia tabuleiro_bomba_maquina[10][11]

		caracter tiposBarcos
		
		caracter letras_colunas[10] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'}

		escreva("\t\t\t\t\t  ++++++++ BATALHA NAVAL ++++++++\n\n\n\n")

		inicializaTabuleiro(tabuleiro_jogador) // Inicializa o tabuleiro do jogador
		inicializaTabuleiro(tabuleiro_maquina) // Inicializa o tabuleiro da máquina
		
		exibirTabuleiro(tabuleiro_jogador, tabuleiro_maquina, letras_colunas) // Exibindo o tabuleiro preenchido
		escreva("\n\n")
		//exibirTabuleiro(tabuleiro_barco_maquina, letras_colunas) // Exibindo o tabuleiro preenchido
		
		tiposDeNavios(tabuleiro_jogador, tabuleiro_maquina)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4082; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */