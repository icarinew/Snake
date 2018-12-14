local cobra = require ('model.cobra')
local jogador = {pontuacao = 0, cobra = cobra}

function jogador:addPontuacao()
	self.pontuacao = self.pontuacao + 1
	cobra:addTamanho()
end

function jogador:getPontuacao()
	return self.pontuacao
end

function jogador:resetJogador()
	self.pontuacao = 0;
end

return jogador