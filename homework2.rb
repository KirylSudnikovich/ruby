class Array
	def to_histogram
		puts self.each_with_object(Hash.new(0)) {|num, a| a[num] += 1}
	end	
end

class Hash
	def safe_invert
		each_with_object({}) do |(key, value), out|
			out[value] ||= []
			out[value] << key
		end
	end
end

['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'].to_histogram
fruits_country = {'orange' => 'Marocco', 'banana' => 'Ecuador',
'lemon' => 'Marocco'}
puts fruits_country.safe_invert
