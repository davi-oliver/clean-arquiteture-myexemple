# learningcleararchdart

This is a project that focuses on learning a clear architecture design in dart, with implementation in TDD (unit test)

## First 
will i separeted anythings like:

UI - View
ViewModel - VM
Repository - Model

### Conceituando
pelo os estudos em aula no youtube, foi citado um exemplo para um simples caso 
se num mesmo projeto onde eu tenho estipuklado que o sistema deve fazer 'A', mas se por acaso eu tiver que usar 'B', o programa se adpte para entender independente de qual plataforma ele irá ser utilizado. Uma vez que o mesmo tenha as mesmas regras de negocio definida.

### conceptualizing 
by the studies in class on youtube, an example was cited for a simple case 
if in the same project where I have stipuklado that the system should do 'A', but if by chance I have to use 'B', the program adpte to understand regardless of which platform it will be used. Once it has the same business rules defined.

### A solução para este problema 
A solução que o clean arch oferece é que o usuario vai se interagir com o sistema atraves da UI, e a UI vai ser gerenciada, por sua vez pelo ViewModel. Model(usercase), separando do ViewModel a regra de negocio. Contudo será usado o pattern Repository para interfaciar os dados para o usercase, que por sua vez dará a infra estrutura para o meu model.
Logo, quem irá acessar os dados externos sera o DataSource. Isto fara com que o restante da aplicação se adpte conforme os dados que são acessados pelo o meu datasource.
No exemplo de um acesso ao github, minha pesquisa será adaptada da mesma forma de que se fosse feito na plataforma YouTube.

O usercase será o dominio da minha aplicação, pois ele será o core da minha aplicação. E para testar meus Models irei validar e implemtar atraves dos testes de unidade. 


### the solution to this problem
the solution that clean arch offers is that the user will interact with the system through the UI, and the UI will be managed, in turn, by the ViewModel. Model(usercase), separating the business rule from the ViewModel. However, the Repository pattern will be used to interface the data to the usercase, which in turn will provide the infrastructure for my model.
Therefore, who will access the external data will be the DataSource. This will make the rest of the application adapt according to the data that is accessed by my datasource.
In the example of an access to github, my search will be adapted in the same way as if it were done on the YouTube platform.

The usercase will be the domain of my application, as it will be the core of my application. And to test my Models I will validate and implement through unit tests.


##### Em ordem de implementação  -- TDD
=> Primeiro deve se definir o Dominio(Model/Entidade/Usercase)
=> A Infra(Repository) servirá de Suporte para o dominio
=> External(Datasource) que será a camada externa, onde se terá os dados de API's e etc.
=> E por fim, Presenter(UI + ViewModel) representará a interface com o usuario (front-end), aqui se colocará os state mananger como mobX, getX, provider e etc.
##### In order of implementation -- TDD
=> First you must define the Domain(Model/Entity/Usercase)
=> Infra(Repository) will serve as Support for the domain
=> External(Datasource) which will be the external layer, where you will have the API's data and so on.
=> And finally, Presenter(UI + ViewModel) will represent the user interface (front-end), here you will place the state manager as mobX, getX, provider and etc


## Criação do Projeto

Para a Criação do projeto, irei usar conforme o video afim de aprender novos state managers além do que eu ja utilizo(mobX).

minha versão atual do flutter é 3.0.5 - enable windows platform, enable android platform and enable web device.
pacotes que irão ser utilizados: 

## Project Creation

For the creation of the project, I will use according to the video in order to learn new state managers in addition to what I already use (mobX).

my current flutter version is 3.0.5 - enable windows platform, enable android platform and enable web device.
packages that will be used:

-- flutter_modular
-- Mockito
-- Dio
-- block





##### O conteudo estudado pertence a playlist de flutterando - youtube 
Link: https://youtu.be/LOBdq_4HnwY
Obs: Texto escrito acima foi feito por minha autoria. O intuito é me expressar em 'resenha' o conhecimento entendido e estudado. Forma de escrita não segue formato didático, pois não possui este fim.

 
