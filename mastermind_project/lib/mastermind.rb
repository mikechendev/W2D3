require_relative "code"

class Mastermind

    def initialize(n)
        @secret_code = Code.random(n)
    end

    def print_matches(instance)
        puts @secret_code.num_exact_matches(instance)
        puts @secret_code.num_near_matches(instance)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        response = gets.chomp
        instance = Code.from_string(response)
        print_matches(instance)
        @secret_code.==(instance)
    end
    
end
