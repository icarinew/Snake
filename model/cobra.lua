local cobra = {tamanho = 1}

function cobra:addTamanho()
	self.tamanho = self.tamanho + 1
end

function cobra:getTamanho()
	return self.tamanho
end

return cobra