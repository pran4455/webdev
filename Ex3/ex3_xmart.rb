def calculate_wage
    print "Enter employee age: "
    age = gets.to_i
  
    unless age.between?(19, 40)
      puts "Enter appropriate age"
      return
    end
  
    print "Enter employee gender (Male/Female): "
    gender = gets.chomp.downcase
  
    print "Enter number of days worked: "
    days_worked = gets.to_i
  
    wage_per_day =
      if age.between?(19, 30)
        gender == "male" ? 800 : 850
      elsif age.between?(31, 40)
        gender == "male" ? 900 : 950
      end
  
    total_wage = wage_per_day * days_worked
    puts "Total wage for #{days_worked} days: ₹#{total_wage}"
  end
  
  # Start the program
  calculate_wage
  