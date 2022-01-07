programa {
	
	funcao inicializaTabuleiro(cadeia tabuleiro[][]) {
		inteiro i=0, j=0
		
		para(i=0; i<9; i++) {
		    para(j=0; j<9; j++) {
		    	tabuleiro[i][j] = " _ "
		    }
		}
	}

	funcao exibirTabuleiro(cadeia tabuleiro[][], caracter letras_colunas[]) {
		
		inicializaLetrasColunas(letras_colunas) // Preenchendo as colunas com as letras para demarcação
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

	funcao funcoesDoJogo() {
		
	}
	
	funcao inicio() {
		cadeia tabuleiro 
		cadeia tabuleiro_barco_jogador[9][10]
		cadeia tabuleiro_bomba_jogador[9][10]
		cadeia tabuleiro_barco_maquina[9][10]
		cadeia tabuleiro_bomba_maquina[9][10]
		caracter letras_colunas[9] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'}
		inteiro i=0, j=0
		inteiro acao1, acao2

		escreva("  ++++++++ BATALHA NAVAL ++++++++\n\n\n\n")

		inicializaTabuleiro(tabuleiro_barco_jogador) // Inicializa o tabuleiro do jogador
		inicializaTabuleiro(tabuleiro_barco_maquina) // Inicializa o tabuleiro da máquina
		
		exibirTabuleiro(tabuleiro_barco_jogador, letras_colunas) // Exibindo o tabuleiro preenchido
		escreva("\n\n")
		exibirTabuleiro(tabuleiro_barco_maquina, letras_colunas) // Exibindo o tabuleiro preenchido
		
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1534; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */