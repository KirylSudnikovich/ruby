require 'date'

def process(date, units, duration, length)

	day_block = lambda { length.times {puts date += 1 * duration } }

	month_block = lambda { length.times {puts date >>= 1 * duration } }

	year_block = lambda { length.times {puts date >>=  12 * duration } }

	newHash = { day: day_block, month: month_block, year: year_block }

	newHash[units.to_sym].call

end

print 'Введите дату в формате DD.MM.YY: '

my_date = Date.parse(gets.chomp)

print 'Выберите единицу измерения : day || month || year: '

unit = gets.chomp

print 'Введите шаг: '

long = gets.chomp.to_i

print 'Введите длительность: '

n = gets.chomp.to_i

process(my_date, unit, long, n)