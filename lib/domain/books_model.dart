int booknumber = 0;

Map<int, Map<String, String>> books = {
  1: {
    'titulo': 'Conan, O Címerio',
    'autor': 'Robert E. Howard',
    'paginas': '212',
    'sinopse':
        'O texano Robert Ervin Howard nasceu em 22 de janeiro de 1906 e faleceu ainda jovem, em 11 de junho de 1936. Tido como o pai do subgênero Espada & Feitiçaria, é o criador, além de Conan, o Bárbaro, de diversos outros personagens, como Solomon Kane, Bran Mak Morn, Red Sonja e o rei Kull. Escritor prolífico, publicou contos de todos os estilos, incluindo histórias de crime, terror, aventura e faroeste. O trabalho que desenvolveu em torno de seu principal personagem, Conan, é considerado um dos pontos mais altos da Era de Ouro dos pulp fictions, nos Estados Unidos.',
    'capa':
        'https://m.media-amazon.com/images/I/51rveJOD6QL._SX372_BO1,204,203,200_.jpg',
    'data': '2022',
  },
  2: {
    'titulo': 'O homem mais rico da Babilônia',
    'autor': 'George S Clason',
    'paginas': '160',
    'sinopse':
        'Com mais de dois milhões de exemplares vendidos no mundo todo, O homem mais rico da Babilônia é um clássico sobre como multiplicar riqueza e solucionar problemas financeiros. Baseando-se nos segredos de sucesso dos antigos babilônicos ― os habitantes da cidade mais rica e próspera de seu tempo ―, George S. Clason mostra soluções ao mesmo tempo sábias e muito atuais para evitar a falta de dinheiro, como não desperdiçar recursos durante tempos de opulência, buscar conhecimento e informação em vez de apenas lucro, assegurar uma renda para o futuro, manter a pontualidade no pagamento de dívidas e, sobretudo, cultivar as próprias aptidões, tornando-se cada vez mais habilidoso e consciente.',
    'capa': 'https://m.media-amazon.com/images/I/81HKcvLn15L.jpg',
    'data': '1926',
  },
  3: {
    'titulo': 'Pai Rico, Pai Pobre',
    'autor': 'Robert T. Kiyosaki',
    'paginas': '336',
    'sinopse':
        'A escola prepara as crianças para o mundo real?  Essa é a primeira pergunta com a qual o leitor se depara neste livro.  O recado é ousado e direto: boa formação e notas altas não bastam para assegurar o sucesso de alguém. O mundo mudou; a maioria dos jovens tem cartão de crédito, antes mesmo de concluir os estudos, e nunca teve aula sobre dinheiro, investimentos, juros etc. Ou seja, eles vão para a escola, mas continuam financeiramente improficientes, despreparados para enfrentar um mundo que valoriza mais as despesas do que a poupança.Para o autor, o conselho mais perigoso que se pode dar a um jovem nos dias de hoje é: “Vá para a escola, tire notas altas e depois procure um trabalho seguro.”  O fato é que agora as regras são outras, e não existe mais emprego garantido para ninguém.  Pai Rico, Pai Pobre demonstra que a questão não é ser empregado ou empregador, mas ter o controle do próprio destino ou delegá-lo a alguém.  É essa a tese de Robert Kiyosaki neste livro substancial e visi nário. Para ele, a formação proporcionada pelo sistema educacional não prepara os jovens para o mundo que encontrarão depois de formados E como os pais podem ensinar aos filhos o que a escola relega? Essa é outra das muitas perguntas que o leitor encontra em Pai Rico, Pai Pobre. Nesse sentido, a proposta do autor é facilitar a tarefa dos pais. Quem entende de contabilidade deve esquecer seus conhecimentos acadêmicos, pois muitas das teorias expostas por Robert Kiyosaki contrariam os princípios contábeis comumente aceitos, e apresentam uma valiosa e moderna percepção do modo como se realizam os investimentos. A sociedade sofre mudanças radicais e, talvez, de proporções maiores do que as ocorridas em séculos passados. Não existe bola de cristal, mas algo é certo: a perspectiva global de transformações transcende nossa realidade imediata. Aconteça o que acontecer, só existem duas alternativas: segurança ou independência financeira. E o objetivo de Pai Rico, Pai Pobre é instruir o leitor  despertar sua inteligência financeira e a de seus filhos. "A principal razão pela qual as pessoas têm problemas financeiros é que passaram anos na escola, mas não aprenderam nada sobre dinheiro. O resultado é que elas aprendem a trabalhar por dinheiro… mas nunca a fazê-lo trabalhar para elas."- Robert Kiyosaki.',
    'capa': 'https://m.media-amazon.com/images/I/81KY9mmrF-L.jpg',
    'data': '1997',
  },
  4: {
    'titulo': 'Do Mil ao Milhão',
    'autor': 'Thiago Nigro',
    'paginas': '192',
    'sinopse':
        'Em seu primeiro livro, Thiago Nigro, criador da plataforma O Primo Rico, ensina aos leitores os três pilares para atingir a independência financeira: gastar bem, investir melhor e ganhar mais. Por meio de dados e de sua própria experiência como investidor e assessor, Nigro mostra que a riqueza é possível para todos – basta estar disposto a aprender e se dedicar.',
    'capa':
        'https://m.media-amazon.com/images/P/B07HQWPVRS.01._SCLZZZZZZZ_SX500_.jpg',
    'data': '2018',
  },
  5: {
    'titulo': 'Os segredos da mente milionária',
    'autor': 'T. Harv Eke',
    'paginas': '176',
    'sinopse':
        'Se as suas finanças andam na corda bamba, talvez esteja na hora de você refletir sobre o que T. Harv Eker chama de "o seu modelo de dinheiro" – um conjunto de crenças que cada um de nós alimenta desde a infância e que molda o nosso destino financeiro, quase sempre nos levando para uma situação difícil.',
    'capa':
        'https://m.media-amazon.com/images/P/B00A3D1FVC.01._SCLZZZZZZZ_SX500_.jpg',
    'data': '2006',
  },
};

class Book {
  Book({
    required this.title,
    required this.autor,
    required this.pages,
    required this.image,
    required this.sinopse,
    required this.date,
    required this.id,
  });

  String title;
  String autor;
  String pages;
  String image;
  String sinopse;
  String date;
  int id;
}

List<Book> booksList = [
  Book(
      title: books[1]!['titulo']!,
      autor: books[1]!['autor']!,
      pages: books[1]!['paginas']!,
      image: books[1]!['capa']!,
      sinopse: books[1]!['sinopse']!,
      date: books[1]!['data']!,
      id: 0),
  Book(
      title: books[2]!['titulo']!,
      autor: books[2]!['autor']!,
      pages: books[2]!['paginas']!,
      image: books[2]!['capa']!,
      sinopse: books[2]!['sinopse']!,
      date: books[2]!['data']!,
      id: 1),
  Book(
      title: books[3]!['titulo']!,
      autor: books[3]!['autor']!,
      pages: books[3]!['paginas']!,
      image: books[3]!['capa']!,
      sinopse: books[3]!['sinopse']!,
      date: books[3]!['data']!,
      id: 2),
  Book(
      title: books[4]!['titulo']!,
      autor: books[4]!['autor']!,
      pages: books[4]!['paginas']!,
      image: books[4]!['capa']!,
      sinopse: books[4]!['sinopse']!,
      date: books[4]!['data']!,
      id: 3),
  Book(
      title: books[5]!['titulo']!,
      autor: books[5]!['autor']!,
      pages: books[5]!['paginas']!,
      image: books[5]!['capa']!,
      sinopse: books[5]!['sinopse']!,
      date: books[5]!['data']!,
      id: 4),
];

void insertDataOnMap(
    {required int booknumber,
    required booktitle,
    required bookautor,
    required bookpages,
    required booksynopsis,
    required bookimage,
    required bookdate}) {
  books[booknumber] = {
    'titulo': booktitle,
    'autor': bookautor,
    'paginas': bookpages,
    'capa': bookimage,
    'data': bookdate,
    'sinopse': booksynopsis,
  };
}

Map<int, Map<int, String>> commentdata = {
  1: {1: 'muito bom', 2: 'gostei'},
  2: {1: 'Gostei muito', 2: 'aaaaadasdasfaaaa'},
  3: {1: 'excelente', 2: 'livro'},
};
