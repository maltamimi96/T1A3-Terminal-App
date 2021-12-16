require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require "tty-prompt"
require_relative "app_functions"
include Calculators
=begin
    
rescue => exception
    

puts ("Please Enter Your weight in kgs")
weight=gets.to_f
puts ("Please Enter Your height in cms")
height=gets.to_f
puts ("Please Enter Your age in years")
age=gets.to_i
=end
total_cal=0.0
diary= {}
prompt = TTY::Prompt.new
 start_menu= prompt.select("Choose an option:") do |menu|
    menu.choice "Calculate BMI"
    menu.choice "Calculate BMR"
    menu.choice "Calculate Calories"
  end

 



def remove_from_diary(dy,ky)
    dy.delete(ky)
end
def add_to_diary(dy,fd,cal)
    dy.store(fd,cal)
end





def get_total_cal(tcal,cal)
return total_cal+=cal
end

if start_menu == "Calculate BMI"
    puts Bmi_calc(weight,height)#display BMI

elsif start_menu == "Calculate BMR" # display BMR     
    puts("Your Basal Metabolic Rate is :  ",Bmr_calc(weight,height,age))

elsif start_menu == "Calculate Calories"#Check calories    
    prompt = TTY::Prompt.new
    cal_menu = prompt.select("Select Option ", %w(Add-Food Food-Diary Exit))
    cal_loop = true
    while cal_loop == true

       
        if cal_menu =="Add-Food" 
            puts ("add Food Here:")
            food = gets.to_s
            if calorie_calc(food) == nil
                puts ("Item not found") 
            else    
                add_to_diary(diary,food,calorie_calc(food))
                puts(diary)
                cal_menu = prompt.select("Select Option ", %w(Add-Food Food-Diary Exit))
            end 
        elsif cal_menu =="Food-Diary" 
            
            delete_food_list = prompt.select("Choose an item to remove",diary, "exit")
            
            cal_menu = prompt.select("Select Option ", %w(Add-Food Food-Diary Exit))
        else
            cal_loop=false    
        end    
      
        
    end
 
end