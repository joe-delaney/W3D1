class Array

    #------my_each-------
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    #------my_select------
    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele) 
        end
        arr
    end

    #------my_reject------
    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele unless prc.call(ele) 
        end
        arr
    end

    #------my_any?------
    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    #------my_all?------
    def my_all?(&prc)
        self.my_each do |ele|
            return false unless prc.call(ele)
        end
        return true
    end

    #------my_flatten-----
    def my_flatten 
        
    end


end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true