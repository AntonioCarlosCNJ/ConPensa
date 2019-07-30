//
//  LabelsController.swift
//  ConPensa
//
//  Created by Filipe Lopes on 09/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit

class LabelsController{
    
    let cat1 = ["[0][0] Se questione sobre a necessidade da compra dos produtos se é essencial em toda compra que fizer.",
                "[0][1] Ex: Será que devo comprar biscoitos se estou querendo emagrecer? Esse item vai me fazer feliz? Tenho um motivo real para querê-lo?",
                "[0][2] Muitos acham que o governo e as empresas são as mais responsáveis pelo grande desperdício de comida. Mas quem realmente dita o que é permitido, produzido e re-utilizado ou não, somos nós, quem compramos e assim, financiamos.",
                "[0][3] Utilizando as demais dicas, também se reduz o consumo e consequentemente o lixo produzido."]
    
    let cat2 = ["[1][0] Compre apenas o necessário, opte por produtos com boas procedências e de maior durabilidade. Evite comprar produtos que estão prestes a vencer. Veja sempre a data de validade do produto.",
                "[1][1] Não compre produtos piratas, isso ajuda a garantir a procedência do produto, tornando-o mais saudável para o meio ambiente.",
                "[1][2] Evite comprar embalagens desnecessárias, como sacolas, embrulhos, etc. Esses são produtos que são lixo assim que são produzido. Isso piora a situação do mundo, dificultando-o de repor os recursos que já utilizamos.",
                "[1][3] Troque os doces por frutas, eles gram lixos naturais que podem ser muito melhor aproveitados."]
    
    let cat3 = ["[2][0] Compre de forma inteligente: Nunca vá as compras quando estiver ansioso, nervoso, eufórico, com fome ou triste. Não use as compras como uma forma de diversão ou válvula de escape. Evite produtos testados em animais. ",
                "[2][1] Não exagere: Só pesquise por itens quando estiver precisando. Leve sacolas de tecidos e só leve o que couber.",
                "[2][2]Passe a diante: Use as idas ao mercado para educar seus filhos sobre propagandas enganosas e a qualidade dos alimentos.",
                "[2][3] Pense na sua Rotina: Monte o seu cardápio primeiro, e assim, monte uma lista se baseando no cardápio que você ou sua nutricionista elaborou. Anote tudo aquilo que irá consumir no café da manhã, almoço, lanches e jantar.",
                "[2][4] Organize a sua lista: Monte a sua lista dividida de acordo com as categorias do supermercado, assim não ficará pensando muito e fará as compras de forma bem mais rápida.",
                "[2][5] Compras mensais: Utilize as compras mensais para comprar produtos de baixo uso e que não estragam ou demoram para estragar. Aproveite as promoções de atacado para comprar em grandes escalas papel higiênico, produtos de limpeza, arroz, macarrão. ",
                "[2][6] Compras mensais: Utilize das compras mensais para controlar a compra de “besteiras” ou de produtos que quer reduzir a compra.",
                "[2][7] Compras Semanais: Utilize as compras semanais para produtos que estragam rápido, assim compra-se em pouca quantidade. Aproveite as promoções de semana para comprar carnes, verduras, leite, etc."]
    
    let cat4 = ["[3][0] Saber a procedência do alimento é muito importante, pois de nada adianta procurar o menor preço s não se importar com a qualidade do alimento, isso não significa que o mais caro é o melhor, devemos sempre pesquisar o melhor preço e a melhor precedência.",
                "[3][1] A empresa faz ações para evitar desperdício? Durante o processo de confecção essa empresa desperdiça quanto?"]
    
    let cat5 = ["[4][0] Faça as refeições na medida: Arroz, utilize meia xícara de chá para cada pessoa e/ou refeição.",
                "[4][1] Faça as refeições na medida: Feijão, utilize 1/3 da xícara de chá para cada pessoa e/ou refeição.",
                "[4][2] Faça as refeições na medida: Massas curtas, utilize o prato que irá usar para comer, assim coloque a quantidade que satisfará para cada pessoa e/ou refeição.",
                "[4][3] Faça as refeições na medida: Espaguete, utilize a boca ou a tampa de uma garrafa pet para medir uma porção para cada pessoa e/ou refeição.",
                "[4][4] Faça as refeições na medida: Legumes, utilize o tamanho da palma da mão para uma porção para cada pessoa e/ou refeição.",
                "[4][5] Faça as refeições na medida: Carnes brancas, utilize 200g para cada pessoa e/ou refeição.",
                "[4][6] Faça as refeições na medida: Carne vermelha, utilize 100g para cada pessoa e/ou refeição.",
                "[4][7] Calcule bem as receitas e assim só abras as embalagens necessárias, se for o caso faça menos ou faça a mais e guarde para comer posteriormente."]
    
    let cat6 = ["[5][0] Reaproveite sobras orgânicas para fazer outras comidas.",
                "[5][1] Procure reciclar sempre que possível.",
                "[5][2] Separe as garrafas pet e veja na sua lista de compra se algum dos ítens pode ser substituído pelas garrafas pet de alguma forma."]
    
    let cat7 = ["[6][0] Cascas de cítricos, batatas, abacate sem o caroço e até mesmo as cascas da banana podem virar bolos, sobremesas, chás, produtos de limpeza e até de beleza.",
                "[6][1] Misture coisas novas, como molhos e carnes, para tornar as sobras mais apetitosas e assim reaproveitar refeições que sobraram."]
    
    let cat8 = ["[7][0] Organização ajuda a evitar o desperdício: Limpe bem o seu estoque para aumentar a durabilidade dos alimentos. Organize-o de forma que consiga ver tudo, produtos escondidos costumam ser esquecidos e assim estragar.",
                "[7][1] Crie uma Dieta e assim um calendário de refeições, isso ajuda a comprar e preparar na medida certa.",
                "[7][2] Documente o resultado, uma boa forma é criar metas e desafios, isso aumenta a motivação e ajuda a lembrar sobre o calendário.",
                "[7][3] Armazene produtos abertos em outras embalagens como portes de vidro e plástico, de preferência transparentes. Mesmo produtos pequenos como frutas e legumes cortados, isso evita que eles ressequem. ",
                "[7][4] Coloque os produtos que utiliza com frequência a altura das mãos, como molhos, temperos e grãos. Coloque no alto apenas os que usa com baixa frequência como papel toalha, itens descartáveis, sacola de lixo, etc, e coloque na parte de baixo produtos pesados como bebidas, assim, evitando acidentes.",
                "[7][5] Aproveite todo o espaço: Use a porta de fora da geladeira para pregar dicas, calendário, receitas e dietas com ímãs. Utilize as portas de armários para pendurar aventais, panos de prato, conchas, sacolas, etc."]
    
    let cat9 = ["[8][0] Conserve os alimentos da forma certa: Embale individualmente as frutas, verduras e legumes.",
                "[8][1] Frutas cortadas ou abertas podem ser conservadas com vinagre, que não modifica no sabor.",
                "[8][2] Corte e higiene as frutas e carnes apenas antes de consumir.",
                "[8][3] Tomates são guardados em temperatura ambiente. Verduras como alface e outras folhagens devem ser soltas, limpas e guardadas em embalagens fechadas."]
    
    var arrayLabels = [[" "," "],[" "," "]]
    
    var categorias = ["0 Porque comprar?",
                      "1 O quê comprar?",
                      "2 Como comprar?",
                      "3 De quem Comprar?",
                      "4 Como usar?",
                      "5 Como Descartar?",
                      "6 Dicas para reaproveitar",
                      "7 Dicas para se organizar",
                      "8 Dicas para não desperdiçar"]
    
    var colors = [UIColor.red,.blue,.brown,.gray,.purple]
    
    init() {
        arrayLabels = [cat1,cat2,cat3,cat4,cat5,cat6,cat7,cat8,cat9]
    }
    
    
    
    
    
}
