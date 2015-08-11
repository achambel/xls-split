# isso é uma dependencia, instalar primeiro via gem install
require 'spreadsheet'
# Sua planilha gigantesca
book = Spreadsheet.open('pai.xls')
# Em qual aba da planilha estao os dados
plan1 = book.worksheet('Plan1')
# O pulo do gato, defina no parametro do metodo each_slice, quantas linhas que dividir
# No meu exemplo, o arquivo pai tem 20 linhas, dividi a cada 5, logo vou ter 4 arquivos com 5 linhas cada
plan1.each_slice(5).each_with_index do |line, index|
	book = Spreadsheet::Workbook.new
	write_sheet = book.create_worksheet
	row_num = 0

	line.each do |row|
		write_sheet.row(row_num).replace row
  	row_num +=1
	end

	book.write "Arquivo_#{index}.xls"

end

