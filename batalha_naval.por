programa {
	inclua biblioteca Util
	inteiro pontuacaoJogador = 0, pontuacaoMaquina = 0, quantNaviosJogador=3, quantNaviosInimigo=3 // pontuacao final e a quantidade de navios do usuário e máquina
	caracter continuar = ' ' // variável que verifica se o jogador pretende continuar jogando após finalizar o jogo
	
	funcao inicializaTabuleiro(cadeia &tabuleiro[][]) {
		inteiro i=0, j=0
		
		para(i=0; i<10; i++) {
		    para(j=0; j<10; j++) {
		    	tabuleiro[i][j] = "  _  "
		    }
		}
	}

	funcao inicializaTabuleiro_bomba(cadeia &tabuleiro[][], inteiro linha, inteiro coluna) {
		inteiro i=0, j=0
		
		para(i=0; i<10; i++) {
		    para(j=0; j<10; j++) {
		    	se(linha == i e coluna == j) {
		    		tabuleiro[i][j] = "  *  "
		    	} senao {
		    		tabuleiro[i][j] = "  _  "
		    	}
	
		    }
		}
	}

	funcao exibirTabuleiro(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][], caracter letras_colunas[]) {
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


	// função que escolhe os tipos de navios para inserção no tabuleiro do jogador principal ou da máquina
	funcao tiposDeNavios(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][]) {
		inteiro opcaoNavio = 0, posicoes = 0
		cadeia tipo = ""
		
		escreva("Tipos de navios disponíveis\n")
		escreva("Bombas representadas por *\n")
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
		inteiro i=0, j=0, k=0, l=0 // variáveis de controle para incremento. A variável l serve para receber o valor da coluna do jogador e inimigo e incrementar até preencher o navio por completo
		caracter letras_colunas[10] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'} // Inicializa o array com os rótulos das colunas
		inteiro linhaJogador = Util.sorteia(0, 9), colunaJogador = Util.sorteia(0, 9), linhaInimigo = Util.sorteia(0, 9), colunaInimigo = Util.sorteia(0, 9)

		para(i=0; i<10; i++) {
		    para(j=0; j<10; j++) {
		    	se(linhaJogador == i e colunaJogador == j) { // Verifica se a linha e a coluna são as que foram passadas por parâmetro para a função
		    		l = colunaJogador // a variável l recebe o valor da variável coluna para incrementar dentro do próximo laço e preencher com o navio nas colunas corretas
		    		
		    		para(k=0; k < posicoes; k++) { // começa a partir da posição da coluna que foi escolhida
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
		    		
		    		para(k=0; k < posicoes; k++) { // começa a partir da posição da coluna que foi escolhida
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
		
			faca {
				
				exibirTabuleiro(tabuleiro, tabuleiro2, letras_colunas )
				disparar(tabuleiro, tabuleiro2) // chama a função disparar
				
				escreva("\t\t----------------------------\n")
				escreva("\t\tNAVIOS DO JOGADOR = ",quantNaviosJogador,"\n")
				escreva("\t\tNAVIOS DA MÁQUINA = ",quantNaviosInimigo,"\n")
				escreva("\t\tPONTUAÇÃO DO JOGADOR = ", pontuacaoJogador,"\n")
				escreva("\t\tPONTUAÇÃO DA MÁQUINA = ", pontuacaoJogador,"\n")
				escreva("\t\t----------------------------\n")
				
			} enquanto(quantNaviosJogador > 0 e quantNaviosInimigo > 0) // os navios forem diferentes de zero
	
			se(quantNaviosJogador > 0 e quantNaviosInimigo <= 0) { // verifica se o jogador ou máquina venceu
				escreva("Você venceu!\n")
			} senao {
				escreva("Você perdeu! A máquina venceu!\n")
			}

			escreva("Deseja continuar jogando? (s) para SIM e (n) para NÃO\n") // pergunta se o jogador deseja continuar o jogo
			leia(continuar)

			se(continuar != 'n' ou continuar != 'N') {
				quantNaviosJogador = 3 // reseta os valores dos navios para o seu valor inicial que é 3
				quantNaviosInimigo = 3
 
			} 

		}enquanto(continuar == 's' ou continuar == 'S')
	}

	funcao disparar(cadeia &tabuleiro_jogador[][], cadeia &tabuleiro_maquina[][]) {
		inteiro linha=0, coluna=0, i, j, count=0
		cadeia valorNavio = ""
		logico acertou // variável para verificar se o jogador ou máquina acertaram o disparo

		

		enquanto(count < 3) {
			acertou = falso
			escreva("\tTentativa ", count+1," para o JOGADOR\n")
			escreva("Informe a linha (1 a 10) que deseja executar o disparo no mapa do inimigo: \n")
			leia(linha)
			escreva("Informe a coluna (1 a 10) que deseja executar o disparo no mapa do inimigo: \n")
			leia(coluna)

			linha -= 1 // garante que a linha que o usuário digitar vai se 1 unidade inferior na verificação, pois a contagem começa do 0
			coluna -= 1 // garante que a coluna que o usuário digitar vai se 1 unidade inferior na verificação, pois a contagem começa do 0

			para(i=0; i<10; i++) {
			    para(j=0; j<10; j++) {
			     se( (tabuleiro_maquina[i][j] != "  _  ") e (linha == i e coluna == j) ) {
			     	acertou = verdadeiro
			     	inicializaTabuleiro_bomba(tabuleiro_maquina, linha, coluna) // chama a função que adiciona a bomba no mapa
			     	quantNaviosInimigo--
			     	pontuacaoJogador++
			     	
			     	se(quantNaviosInimigo == 0) {
			     		count = 3 // encerra o laço enquanto
			     	}
			     }
			    }
			}


			se(acertou) {
				escreva("Você acertou\n")
			} senao {
				escreva("Bomba na água\n")
			}
			
			count++
			escreva("\n")
		}

		count = 0 // zera a variável de controle

		enquanto(count < 3) {
			acertou = falso
			escreva("\tTentativa ", count+1," para a MÁQUINA\n")
			linha = Util.sorteia(1, 10)
			linha = Util.sorteia(1, 10)

			para(i=0; i<10; i++) {
			    para(j=0; j<10; j++) {
			     se( (tabuleiro_jogador[i][j] != "  _  ") e (linha == i e coluna == j) ) {
			     	acertou = verdadeiro
			     	inicializaTabuleiro_bomba(tabuleiro_maquina, linha, coluna)
			     	quantNaviosJogador-- // reduz em uma unidade a quantidade total de navios do jogador
			     	pontuacaoMaquina++ // incrementa em uma unidade a pontuação final da máquina, caso tenha acertado o disparo

			     	se(quantNaviosJogador == 0) {
			     		count = 3 // encerra o laço enquanto
			     	}
			     }
			    }
			}

			se(acertou) {
				escreva("Máquina acertou\n")
			} senao {
				escreva("Bomba na água\n")
			}
			
			count++
			escreva("\n")
		}
		
	}
	
	funcao inicio() {
		//cadeia tabuleiro 
		cadeia tabuleiro_jogador[10][11] // coluna com 11 posições devido a uma posição ser utilizada para espaço entre marcadores de linhas e colunas (números e letras)
		cadeia tabuleiro_bomba_jogador[10][11]
		cadeia tabuleiro_maquina[10][11]
		cadeia tabuleiro_bomba_maquina[10][11]

		//caracter tiposBarcos
		
		caracter letras_colunas[10] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'}

		escreva("\t\t\t\t\t\t  ++++++++ BATALHA NAVAL ++++++++\n\n\n\n")
		

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
 * @POSICAO-CURSOR = 2267; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */