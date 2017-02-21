class RamdomController < ApplicationController
    def index
        # logger.debug(params[:practice1][:type])
        if params[:type].present?
            @type = params[:type]
        end

        if params[:contain_type].present?
            @contain_type = params[:contain_type]
        end

        if params[:digits].present?
            @digits = params[:digits]
        end

        @digit_options = {}
        for num in 4..30 do
            @digit_options[num] = num
        end

        if @type.present? || @contain_type.present? || @digits.present?
            loop_count = 0
            digits = @digits.to_i
            while loop_count < 10000 do
                o = [('a'..'z'), ('A'..'Z'), ('0'..'9'),"! # $ % & @ + * ?".split(/\s+/)].map { |i| i.to_a }.flatten
                @password = (0...digits).map { o[rand(o.length)] }.join
                loop_count += 0
                if @password
                    break
                end
            end
        end
    end
end
