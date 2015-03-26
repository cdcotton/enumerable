module Enumerable
    def my_each
        for i in 0...self.length
            yield self[i]    
        end
        self
    end

    def my_each_with_index
        for i in 0...self.length
            yield self[i], i    
        end
        self
    end
    
    def my_select
        selection = []
        self.my_each do |n|
            selection << n if yield n   
        end
        selection
    end
    
    def my_all?
        all = false
        self.my_each do |n|
            all = yield n    
        end
        all
    end
end

test = ["a", "b", "c"]
all = test.my_all? do |letter|
    letter == "a"
end

puts all