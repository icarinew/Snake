-- Inclui a biblioteca do sqlite
local sqlite = require ( "sqlite3" )

-- Abre o "banco.db", se o arquivo não existir ele será criado
local path = system.pathForFile("banco.db", system.DocumentsDirectory)
local db = sqlite.open( path )

-- Cria a tabela de nome "tabela" se ela não existir, com os campos "id" e "nome"
db:exec( "CREATE TABLE IF NOT EXISTS tabela (id INTEGER PRIMARY KEY, nome);" )

-- Função que recebe como parametro um nome e faz a inserção no banco
local function Insere(nome)
    local insert = "INSERT INTO tabela VALUES (NULL, '" .. nome .. "' );" -- Concatena o parametro "nome" na variavel "insert"
    db:exec( insert ) -- Executa a inserção no banco
end

-- Chama a função Insere passando como parâmetro o nome que deseja inserir
Insere("joao")
Insere("pedro")
Insere("renata")
Insere("julia")

-- Laço que percorre todas as linhas da tabela "tabela"
for row in db:nrows("SELECT * FROM tabela") do
    local txId   = display.newText(row.id .. " - ", 10, 30 * row.id, native.systemFont, 18) -- Texto que mostra o "id"
    local txNome = display.newText(row.nome, 34, 30 * row.id, native.systemFont, 18) -- Texto que mostra o "nome"
end

db:close() -- Fecha a conexão com o banco