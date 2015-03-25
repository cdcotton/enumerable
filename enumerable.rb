module Enumerable
    def my_each
        for i in 0...self.length
            yield self[i]    
        end
        self
    end
end

test = ["a", "b", "c"]
test.my_each do |letter|
    print letter + " -- "
end