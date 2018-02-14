require "rexml/document"
include REXML

$maxCountry = ""
$maxPopulation = 0
class Country
	def initialize(element)
		@name = element.attributes["name"]
		@continent = element.attributes["continent"]
		@population = element.attributes["population"].to_i
		@inflation = element.attributes["inflation"].to_i
	end
end

class Continent
	def initialize(element)
		@name = element.attributes["name"].to_s
	endе 
end

class World
	def initialize(doc)
		@countries = []
		@continents = []
		doc.elements.each("cia/country") { |element| 
			country = Country.new(element)
			@countries.push(country)
		}
		doc.elements.each("cia/continent") { |element|
			continent = Continent.new(element)
			@continents.push(continent)
		}
		$maxCountry = @countries.max_by {|x| x.instance_variable_get :@population}
		print "Страна с наибольшим населением - ", ($maxCountry.instance_variable_get :@name), ". В ней проживает ", ($maxPopulation = $maxCountry.instance_variable_get :@population), " человек.\n\n"
	end

	def Show1
		array = []
		@continents.each do |continent|
			@countries.each {|country| array.push((country.instance_variable_get :@name)) if (continent.instance_variable_get :@name) == (country.instance_variable_get :@continent)}
			array.sort
			print "\n\nСписок стран в ", (continent.instance_variable_get :@name), " : "
			array.each {|x| print x, ", "}
			array.clear
		end
	end

	def Inflation
		puts "\n\n5 стран с наибольшим уровнем инфляции: "
		5.times do 
			country = @countries.max_by {|x| x.instance_variable_get :@inflation}
			print (country.instance_variable_get :@name), " - ", (inflation = country.instance_variable_get :@inflation) , " %.\n"
			@countries.delete(country)
		end
	end
end

doc = Document.new File.new("cia-1996.xml")

world = World.new(doc)
world.Show1
world.Inflation