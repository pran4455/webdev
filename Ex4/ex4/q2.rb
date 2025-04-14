"""
Write a Ruby program that uses arrays to manage a simple student gradebook. The program
should allow users to perform the following operations:
Implement functionality to:
    • Add a new student with their grades.
    • Update grades for an existing student.
    • Remove a student from the gradebook using their student ID.
    • Calculate and display the average grade for a specific student.
    • Display a subset of students using array slicing (by specifying start and end
    indices).
    • Display the full gradebook with student details and their average grades.
"""

class Gradebook
    def initialize
      @students = { 
        "S001" => { name: "Alice", grades: [85, 90, 78] },
        "S002" => { name: "Bob", grades: [75, 80, 88] },
        "S003" => { name: "Charlie", grades: [90, 92, 95] }
      }
    end
  
    def add_student
      print "Enter new student ID: "
      id = gets.chomp
      print "Enter student name: "
      name = gets.chomp
      print "Enter student grades (comma-separated): "
      grades = gets.chomp.split(",").map(&:to_i)
      @students[id] = { name: name, grades: grades }
      puts "New student added!"
    end
  
    def update_grades
      print "Enter student ID to update grades: "
      id = gets.chomp
      if @students.key?(id)
        print "Enter new grades (comma-separated): "
        new_grades = gets.chomp.split(",").map(&:to_i)
        @students[id][:grades] = new_grades
        puts "Student grades updated!"
      else
        puts "Student ID not found!"
      end
    end
  
    def remove_student
      print "Enter student ID to remove: "
      id = gets.chomp
      if @students.delete(id)
        puts "Student removed successfully!"
      else
        puts "Student ID not found!"
      end
    end
  
    def calculate_average
      print "Enter student ID to calculate average grade: "
      id = gets.chomp
      if @students.key?(id)
        avg = @students[id][:grades].sum.to_f / @students[id][:grades].size
        puts "Average grade for #{@students[id][:name]}: #{avg.round(2)}"
      else
        puts "Student ID not found!"
      end
    end
  
    def display_subset
        print "Enter starting index: "
        start_idx = gets.chomp.to_i
        print "Enter ending index: "
        end_idx = gets.chomp.to_i
      
        student_array = @students.to_a[start_idx..end_idx]
        if student_array.nil? || student_array.empty?
          puts "Invalid indices or no students in the range!"
          return
        end
      
        student_array.each do |id, student|
          avg = student[:grades].sum.to_f / student[:grades].size
          puts "#{student[:name]} (ID: #{id}) - Average Grade: #{avg.round(2)}"
        end
      end      
  
    def display_gradebook
      puts "\nGradebook:"
      puts "Name\tStudent ID\tGrades\t\tAverage Grade"
      @students.each do |id, student|
        avg = student[:grades].sum.to_f / student[:grades].size
        puts "#{student[:name]}\t#{id}\t#{student[:grades].join(', ')}\t#{avg.round(2)}"
      end
    end
  end
  
  # Program Execution
  gb = Gradebook.new
  
  loop do
    puts "\nStudent Gradebook Management System"
    puts "1. Add Student"
    puts "2. Update Student Grades"
    puts "3. Remove Student"
    puts "4. Calculate Average Grade"
    puts "5. Display Subset of Students"
    puts "6. Display Full Gradebook"
    puts "7. Exit"
    print "Choose an option: "
    
    choice = gets.chomp.to_i
  
    case choice
    when 1
      gb.add_student
    when 2
      gb.update_grades
    when 3
      gb.remove_student
    when 4
      gb.calculate_average
    when 5
      gb.display_subset
    when 6
      gb.display_gradebook
    when 7
      puts "Exiting program. Goodbye!"
      break
    else
      puts "Invalid option, please try again."
    end
  end
