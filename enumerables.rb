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
        new_arr = []
        self.my_each do |data|
            if data.is_a?(Array)
                new_arr += data.my_flatten
            else
                new_arr << data
            end
        end
        new_arr
    end

    #------my_zip-----
    def my_zip(*args)
        arr = Array.new(self.length) { Array.new() }
        (0...arr.length).each do |i|
            arr[i] << self[i]
            args.each do |arg|
                arr[i] << arg[i]
            end
        end
        arr
    end

    #------my_rotate-----
    def my_rotate(n = 1)
        new_arr = self.dup
        if n > 0
            while n > 0
                temp = new_arr.shift
                new_arr << temp
                n -= 1
            end
        else
            while n < 0
                temp = new_arr.pop
                new_arr.unshift(temp)
                n += 1
            end
        end
        new_arr
    end

    #------my_join-----
    def my_join(s = "")
        new_str = ""
        self.my_each { |el| new_str += el + s }
        new_str
    end

    #------my_reverse-----
    def my_reverse
        new_arr = []
        i = self.length - 1
        while i >= 0
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end
end
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]