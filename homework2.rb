class Array
	def to_histogram
		puts self.each_with_object(Hash.new(0)) {|num, a| a[num] += 1}
	end	
end

class Hash
	def safe_invert
		puts self.each_with_object(Hash.new { |k, v| k[v] =[] }) {|(v,r),k| k[r] << v}
	end
end

['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'].to_histogram
fruits_country = {'orange' => 'Marocco', 'banana' => 'Ecuador',
'lemon' => 'Marocco'}
fruits_country.safe_invert
