# Leia-me

O sistema reclame fácil foi desenvolvido com o intuíto de fornecer aos cidadãos uma
maneira fácil e intuítiva de registrar as ocorrências e problemas enfrentados em
diversos municípios. O sistema foi desenvolvido em plataforma aberta (Open Source),
tendo como base os seguintes softwares:

* Pré requisitos

Para implantar o software siga as instruções abaixo:

```
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
curl -sSL https://get.rvm.io | bash
rvm install ruby-2.6.0
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
sudo apt install nodejs
```
* Configuração

Para configurar navegue até o diretório da aplicação execute os seguintes procedimentos:

```
gem install bundler
gem install pg
```

* Criação e Inicialização do Banco de Dados
```
rake db:setup
rake db:migrate
```
* ...
