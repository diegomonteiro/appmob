class City < ApplicationRecord

	def self.importar_municipios_ibge
		response = RestClient.get 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/35/municipios'
		rst = JSON.parse(response)
		
		rst.each do |city|
			c = City.new
			c.name 		= city["nome"]
			c.cod_ibge  = city["id"]
			c.uf   		= city["microrregiao"]["mesorregiao"]["UF"]["sigla"]

			c.save
		end

	end

end
