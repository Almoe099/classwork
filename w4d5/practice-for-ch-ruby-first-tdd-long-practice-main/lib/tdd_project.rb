class Array

    def uniq
        return self if self.length == 0
        hash = Hash.new(0)
        self.each {|el| hash[el] += 1}
        hash.keys
    end

    def two_sum
        sum = []
    
        (0...self.length).each do |i|
          ((i + 1)...self.length).each do |j|
            if self[i].is_a?(Numeric) && self[j].is_a?(Numeric) && self[i] + self[j] == 0
              sum << [i, j]
            end
          end
        end
    
        sum.sort_by { |a, b| [a, b] }
    end

    


end