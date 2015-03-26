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
    
    def my_any?
        any = false
        self.my_each do |n|
            met = yield n
            any = met if met
        end
        any
    end
end

test = ["a", "b", "c"]
any = test.my_any? do |letter|
    letter == "a"
end

puts any