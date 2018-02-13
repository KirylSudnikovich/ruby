require 'date'

print 'Введите дату в формате DD.MM.YY: '
my_date = Date.parse(gets.chomp)
print 'Выберите единицу измерения : day || month || year: '
ed = gets.chomp
print 'Выберите длительность: '
long = gets.chomp.to_i

day_block = lambda do
	puts "Enter"
	i = 0 
	while i < long do
		my_date += 1
		puts my_date
		i += 1
	end
end

month_block = lambda do
	i = 0
	while i < long do
		my_date = my_date >> 1
		puts my_date
		i += 1
	end
end

year_block = lambda do
	i = 0
	while i < long do
		my_date = my_date >> 12
		puts my_date
		i += 1
	end
end

newHash = {
	"day" => day_block,
	"month" => month_block,
	"year" => year_block,
}

puts newHash[ed].call