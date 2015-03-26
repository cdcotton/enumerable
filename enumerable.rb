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
    
    def my_none?
        any = false
        self.my_each do |n|
            met = yield n
            any = met if met
        end
        !any  
    end
    
    def my_count
        count = 0
        self.my_each do |n|
            if block_given?
                count += 1 if yield n
            else
                count += 1
            end
        end
        count
    end
end

test = ["a", "b", "c"]
count = test.my_count do |letter|
    letter == "a"
end

puts count
puts test.my_count