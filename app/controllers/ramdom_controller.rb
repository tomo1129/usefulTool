class RamdomController < ApplicationController
    def index
        # logger.debug(params[:practice1][:type])
        @toolPage = true
        if params[:digits].present?
            @digits = params[:digits]
        end

        @type = []
        if params[:type].present?
            @type = params[:type]
        end

        @digit_options = {}
        for num in 6..30 do
            @digit_options[num] = num
        end

        if @type.present? || @contain_type.present? || @digits.present?
            loop_count = 0
            digits = @digits.to_i
            numeric = ('0'..'9')
            lower_alphabet = ('a'..'z')
            upper_alphabet = ('A'..'Z')
            symbol = '! # $ % & @ + * ?'.split(/\s+/)
            char = []

            if @type.empty?
                char.push(numeric, lower_alphabet, upper_alphabet, symbol)
            else
                if @type.include?(NUMERIC)
                    char.push(numeric)
                end
                if @type.include?(LOWER_ALPHABET)
                    char.push(lower_alphabet)
                end
                if @type.include?(UPPER_ALPHABET)
                    char.push(upper_alphabet)
                end
                if @type.include?(SYMBOL)
                    char.push(symbol)
                end
            end

            while loop_count < 10000 do
                o = char.map { |i| i.to_a }.flatten
                @password = (0...digits).map { o[rand(o.length)] }.join
                loop_count += 0

                if @type.empty?
                    break
                else
                    if @type.include?(NUMERIC)
                        if @password.gsub(/[0-9]/,'').length == digits
                            next
                        end
                    end
                    if @type.include?(LOWER_ALPHABET)
                        if @password.gsub(/[a-z]/,'').length == digits
                            next
                        end
                    end
                    if @type.include?(UPPER_ALPHABET)
                        if @password.gsub(/[A-Z]/,'').length == digits
                            next
                        end
                    end
                    if @type.include?(SYMBOL)
                        if @password.gsub(/[!#\$%&@\+\*\?]/,'').length == digits
                            next
                        end
                    end
                end

                break
            end
        end
    end
end
