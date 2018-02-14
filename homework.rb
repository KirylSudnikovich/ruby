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

		if @population > $maxPopulation
			$maxCountry = @name.to_s
			$maxPopulation = @population.to_i
		end
	end
end

class Continent
	def initialize(element)
		@name = element.attributes["name"].to_s
	end
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

		puts "Страна с наибольшим населением - #{$maxCountry}. В ней проживает #{$maxPopulation} человек." 
	end

	def Show
		array = []
		@continents.each do |continent|
		continentName = continent.instance_variable_get :@name
			@countries.each do |country|
				countryContitent = country.instance_variable_get :@continent
				if continentName == countryContitent
					s = country.instance_variable_get :@name
					array.push(s)
				end
			end
			array.sort
			puts "\n\nСписок стран в #{continentName} : "
			array.each do |x|
				print x,", "
			end
			array.clear
		end
	end

	def Inflation
		puts "\n\n5 стран с наибольшим уровнем инфляции: "
		array = [["name",0], ["name",0], ["name",0], ["name",0], ["name",0]]
		@countries.each do |country|
			mini = 0
			countryName = country.instance_variable_get :@name
			inflation = country.instance_variable_get :@inflation

			array.each do |x|
				if inflation - x[1] > mini
					mini = inflation - x[1]
				end
			end

			array.each do |x|
				if inflation - x[1] == mini
					x[0] = countryName
					x[1] = inflation
					break
				end
			end
		end
		array.sort.each do |x|
			puts x
		end
	end
end

doc = Document.new File.new("cia-1996.xml")

world = World.new(doc)
world.Show
world.Inflation