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
    
    def my_map
        map = []
        self.my_each do |n|
            map << yield(n)    
        end
        map
    end
    
    def my_inject(initial = nil)
        initial = self[0] if initial.nil?
        memo = initial
        self.my_each do |n|
            memo = yield(memo, n)    
        end
        memo
    end
end

def multiply_els(array)
    array.my_inject(2) do |product, n|
        product * n       
    end
end

array = [1, 2, 3]
puts multiply_els(array)