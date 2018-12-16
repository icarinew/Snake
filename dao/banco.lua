-- Inclui a biblioteca do sqlite
local sqlite = require ( "sqlite3" )

-- Abre o "banco.db", se o arquivo não existir ele será criado
local path = system.pathForFile("banco.db", system.DocumentsDirectory)
local db = sqlite.open( path )

local banco = {}

local criarJogador = [[CREATE TABLE IF NOT EXISTS jogador (pontuacao INTEGER);]]
db:exec( criarJogador )

local inserir = [[INSERT INTO jogador (pontuacao) VALUES (0);]]
db:exec(inserir)

function banco:atualizarPontuacao(novaPontuacao)
	local pontuacao =  self:getPontuacao() + 0
	if(pontuacao < novaPontuacao) then
		 local script = [[UPDATE jogador SET pontuacao = ']]..novaPontuacao..[[';]]
   		 db:exec(script)
	end
end

function banco:getPontuacao()
	for row in db:urows('SELECT pontuacao from jogador') do
        return row
    end
    return 0
end 

return banco
