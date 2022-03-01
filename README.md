#### Olá, meu nome é Renato Leal. Trago neste README a apresentação do projeto Curso Certo, que compreende a criação de um App para uma empresa de LXP (Learning Experience Platform). Afim de auxiliar os usuários do App a adquirirem conhecimento através deste, nele estão disponíveis duas telas. A tela principal, que exibe dois Carrosséis contendo Card dos cursos disponíveis, divididos em suas categorias: Cursos da área Fiscal e Cursos da área Contábil. A segunda tela surge com a interação do usuário ao clicar em algum Card. Quando um determinado Card é selecionado, a tela de Detalhes é chamada e apresenta vários detalhes do curso escolhido, como Descrição, Objetivo, Título, Subtítulo e também um Banner maneiro! Ahh! E como os dados são adquiridos através de uma API externa, caso os texto sejam maiores que a tela do aparelho do usuário, o App tem um SingleChildScrollView preparado para aplicar a função de arrastar para cima e não trazer nenhuma experiência negativa ao usuário.

#### Muito bem, agora vou disponibilizar algumas imagens e vídeos da aplicação em funcionamento para aumentar aquela vontade em você, de ler toda a documentação e descobrir quais Tecnologias e Packages eu utilizei no projeto:

#### Pequeno vídeo do App em funcionamento desde a abertura. * Apple Simulator com o device: iPhone11:

https://user-images.githubusercontent.com/88440878/156220123-756a48a3-e923-4b7e-b121-20746d1e56b9.mov



#### Pequeno vídeo do App em funcionamento desde a abertura. * iPhone11 físico:

https://user-images.githubusercontent.com/88440878/156220359-bb7a02ac-042e-4c13-b8ca-dfa4c25e1e8a.mov



#### Pequeno vídeo do App em funcionamento desde a abertura. * Android LG K8+ físico:

https://user-images.githubusercontent.com/88440878/156220472-bbf6e9ef-fd29-4711-b107-3dabfc205147.mp4



#### Imagens das telas do App em funcionamento. * Apple Simulator com o device: iPhone11:
![f_telaDetalhes_simulator_iPhone11](https://user-images.githubusercontent.com/88440878/156220645-0cb2bec9-e364-48ca-a108-50f6cec14388.png)
![f_telaPrincipal_simulator_iPhone11](https://user-images.githubusercontent.com/88440878/156220659-2d495b39-f97c-41a9-ad44-00a2a5ebda5f.png)



#### Bom, vamos lá! Agora que você já tem uma noção do que se trata esse App, vou explicar para você um pouco sobre como esse App é ‘por dentro’. Inicialmente, quero te dizer que ele foi totalmente desenvolvido com Flutter, utilizando a linguagem de programação Dart! Em resumo, o projeto foi criado da seguinte forma:
- Duas telas e um SplashScreen compõem o App;
- Na abertura do App, enquanto uma Função Future faz as requisições das API, é exibido uma tela de SplashScreen contendo o Logo e o nome do App;
- Após as requisições terem sido feitas e o retorno tiver sido positivo, a Tela Principal aparece para o usuário, exibindo dois Carrosséis com Cards dos cursos disponíveis, separados por categoria;
- Quando o usuário seleciona algum Card, a tela de Detalhes do curso selecionado é exibida. E com ela, um appBar com o botão voltar, que o leva para a tela principal novamente e o Carrossel estará na mesma posição que estava quando ele clicou. Essa tela de detalhes recebe como parâmetro ao ser chamada, todos os dados necessários para chamar outra Função Future, que por suas vez, irá requisitar os dados de Descrição e Objetivo do curso selecionado, que se encontra em outra API. Enquanto essa API é requisitada e retorna com a informação, um CircularProgressIndicator Personalizado é exibido na tela;
- Utilizei o Package: PageTransition para aplicar um efeito ‘fade’ na troca de uma tela para outra;
- Adicionei em cada Card (de forma dinâmica), um ‘contador de páginas’, porque a escola possui muitos cursos e usuário poderia se sentir perdido em tantos Cards sem saber em qual está no momento;
- Todo o projeto foi estruturado em 3 pastas e o arquivo main.dart ‘solto’ na pasta lib. Essas pastas são: 
- componentes: que armazena todos os componentes da aplicação de forma que facilite a localização;
  - repositor: que armazena os dois arquivos responsáveis por fazer as requisições API, e
  - screens: que armazena os arquivos do dois Widgets de tela (Page).
- Packages utiizados no projeto: 
``` 
  animated_splash_screen: ^1.2.0
  http: ^0.13.4
  page_transition: ^2.0.5
```



##### Ahh!, só fazendo um adendo... Utilizei uma paleta de cores em homenagem ao povo Ucraniano:

>“Esse projeto foi desenvolvido no período de Quinta-feira(24.02.2022) à Terça-feira(01.03.2022). Desde o início, até o final deste projeto, o Mundo vive uma triste realidade, um conflito armado entre Rússia e Ucrânia. Não quero, de modo algum, julgar qualquer das nações, mas, em homenagem a todo o povo Ucraniano, que está sofrendo uma restrição de liberdade e paz, só vista, outrora, na Segunda guerra Mundial, decidi por compor a paleta de cores deste projeto, com tons e sobre-tons das cores da bandeira nacional da Ucrânia. Sei que esse gesto não acabará com a guerra, muito menos trará à vida, àqueles que se foram no conflito, mas, que ao menos, cada vez que eu ou alguém abrir esse projeto (App), lembre-se dos envolvidos e, uma oração, reza, prece ou seja lá qual denominção usar para expressar e desejar o bem, seja feita. Isso sim, fará toda a diferença!” (Renato Leal.)
>
