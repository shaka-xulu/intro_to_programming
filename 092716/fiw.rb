
.irb
def three_nos_to_words(x)
    units_dict = {
        "0" => "",
        "1" => "one",
        "2" => "two",
        "3" => "three",
        "4" => "four",
        "5" => "five",
        "6" => "six",
        "7" => "seven",
        "8" => "eight",
        "9" => "nine"
    }

    tens_dict = {
        "0" => "",
        "2" => "twenty",
        "3" => "thirty",
        "4" => "forty",
        "5" => "fifty",
        "6" => "sixty",
        "7" => "seventy",
        "8" => "eighty",
        "9" => "ninety"
    }

    one_tens_dict= {
        "10" => "ten",
        "11" => "eleven",
        "12" => "twelve",
        "13" => "thirteen",
        "14" => "fourteen",
        "15" => "fifteen",
        "16" => "sixteen",
        "17" => "seventeen",
        "18" => "eighteen",
        "19" => "nineteen"
    }
    length = x.length
    if length == 3
        hundred = x[0]
        if hundred == "0"
            hundred_in_word = ""
        else
            hundred_in_word = units_dict[hundred] + " hundred"
        end
        tens = x[1,2]
        #Check if its is one_tens
        if tens[0] == "1"
            tens_in_word = one_tens_dict[tens]
        else
            tens_in_word = tens_dict[tens[0]] +" "+ units_dict[tens[1]]
        end
        not hundred_in_word.empty? and tens_in_word.strip.empty? ? tens_in_word = tens_in_word : tens_in_word = " and " + tens_in_word 
        word = hundred_in_word + tens_in_word

    elsif length == 2
        tens = x
        #Check if its is one_tens
        if tens[0] == "1"
            word = one_tens_dict[tens]
        else
            word = tens_dict[tens[0]] +" "+ units_dict[tens[1]]
        end
    elsif length == 1
        word = units_dict[x]
    else
        puts "x must be a number between 0 and 100"
    end        
end

def fiw(x)
    x = String x
    if x[0] == "-"
        x = x[1..-1]
        is_neg = true 
    else
        is_neg = false
    end

    x_array = x.split("")
    outer_array = []
    inner_array = []
    until x_array.length == 0 do
        popped = x_array.pop
        inner_array.unshift(popped)
        if inner_array.length == 3
            outer_array.unshift(inner_array.inject(""){|agg,i| agg+i})
            inner_array = []
        end
        if x_array.length == 0 and inner_array.length > 0
            outer_array.unshift(inner_array.inject(""){|agg,i| agg+i})
            inner_array = []
        end
    end

    length = outer_array.length
    billion_text = ""
    million_text = ""
    thousand_text = ""
    unit_text = ""
    if length == 4
        billion_text = three_nos_to_words(outer_array[0]) + " billion"
        million_text = three_nos_to_words(outer_array[1]) + " million"
        thousand_text = three_nos_to_words(outer_array[2])
        thousand_text.strip.empty? ? thousand_text = thousand_text.strip : thousand_text = thousand_text.strip + " thousand"
        unit_text = three_nos_to_words(outer_array[3])

        output = "#{billion_text}, #{million_text}, #{thousand_text}, #{unit_text}"
    elsif length == 3
        million_text = three_nos_to_words(outer_array[0]) + " million"
        thousand_text = three_nos_to_words(outer_array[1])
        thousand_text.strip.empty? ? thousand_text = thousand_text.strip : thousand_text = thousand_text.strip + " thousand"
        unit_text = three_nos_to_words(outer_array[2])
        output = "#{million_text}, #{thousand_text}, #{unit_text}"
    elsif length == 2
        thousand_text = three_nos_to_words(outer_array[0]) + " thousand"
        unit_text = three_nos_to_words(outer_array[1])
        output = "#{thousand_text}, #{unit_text}"
    elsif length == 1
        unit_text = three_nos_to_words(outer_array[0])
        output = "#{unit_text}"
    else
        output =  "something is wrong" 
    end

    if is_neg
        puts ("NEGATIVE " + output.upcase) 
    else
        puts output.upcase
    end
end

fiw(180441)
fiw(-1009009)
fiw(1111122980)
#puts three_nos_to_words("000")
# puts three_nos_to_words("190")
# puts three_nos_to_words("09")
# puts three_nos_to_words("122")
