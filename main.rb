#require 'pry'
x, y, x1, y1 = ARGV

if x==x1 and y==y1  
	puts "Точка найдена"
		elsif x==x1	
			puts 'x координата верна, y нет'
		elsif y==y1
			puts 'y координата верна, x нет'
else
	puts "Близко, но нет"		

	
# case 
# 	when x==x1 && y==y1
# 		puts "Точка найдена"
# 	when x==x1 && y!=y1
# 		puts 'x координата верна, y нет'
# 	when x!=x1 && y==y1
# 		puts 'y координата верна, x нет'
# 	else 							
# 		puts "Близко, но нет"	


		
end
#binding.pry