POCPlacar
=========

Here is the POC Placar iOS project.
All the data coming from the Placar API and displayed in this application are retrieved from only one URL :
http://ext-api.placar.abril.com.br/campeonatos/:campeonato/materias

The following token is used as a http header field to connect the Placar - API :
KEY : X-Placar-Token
VALUE : Token token="8625adda9058039971985eb1bbc4cff9d5bd2e7f1617fce3a1c1ed3dad87f74b62ac4f548f7f7dfd664acab6c45cedfcc657fb7ea7f59ac6ee58354aa59bfbd8"

To retrieve the data from the API, an external open source library called AFNetworking is used. The current version is here : ./POCPlacarAbril/Tools/Network/
The original source code can be found here : https://github.com/AFNetworking/AFNetworking