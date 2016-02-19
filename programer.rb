require 'pry'

class	Developer
	MAX_TASKS = 10
	
  def initialize(name)
  
    @name_variable = name
    @task_array = Array.new() #если не создать переменную то не пройдет первая 
                              #проверка @task_array.length в add_task
                              #можно конечно создать проверку в add_task но 
                              #наверно лучше переменную создать чем так усложнять
  end

  
  def add_task(name_task)

    raise(ArgumentError) if MAX_TASKS <= @task_array.length
    
      @task_array << name_task 
      puts %Q{%s: добавлена задача "%s". Всего в списке задач: %i} %
        [@name_variable, name_task, @task_array.count]
    
    rescue ArgumentError
      puts 'Слишком много работы!'
  end

  def tasks
    @task_array.each_with_index.map{|val, i| "#{i+1}. #{val}"}
  end
	
  def work!
    raise(ArgumentError) if @task_array.empty?
  
      puts  %Q{%s: выполнена задача "%s". Осталось задач: %i} %
        [@name_variable, @task_array.shift, @task_array.count]
    
    raise(ArgumentError) if @task_array.empty?
    
    rescue ArgumentError
      puts 'Нечего делать!'

  end
  
  def status
    case 
      when !can_work?
        'Свободен!'
      when !can_add_task?
        'занят'
      else
        'работаю'
    end
  end

  def can_add_task?
    @task_array.count < MAX_TASKS
  end
  
  def can_work?
    !@task_array.count.zero?
  end

end

class JuniorDeveloper < Developer
  
  MAX_TASKS = 5
   
  def add_task(name_task)

    raise(ArgumentError) if MAX_TASKS <= @task_array.length  
    raise (RuntimeError)  if 20 < name_task.size
    #не разобрался как тут правильно бросать исключения, по этому сделал
    #как смог, а бы выполнить условия задачи :) 
    #буду признателен если напишите как можно было сделать
    #я так понял что нужно создавать свои коды ошибок и потом ловить их

      @task_array << name_task 
      
      puts %Q{%s: добавлена задача "%s". Всего в списке задач: %i} %
        [@name_variable, name_task, @task_array.count]
    
    rescue ArgumentError
      puts 'Слишком много работы!'
        
    rescue RuntimeError
      puts 'Слишком сложно!'
  end

  def work!

    raise(ArgumentError) if @task_array.empty?
  
      puts  %Q{%s: пытаюсь делать задачу "%s". Осталось задач: %i} %
        [@name_variable, @task_array.shift, @task_array.count]
    
    raise(ArgumentError) if @task_array.empty?
    
    rescue ArgumentError
      puts 'Нечего делать!'
  end
end

class SeniorDeveloper < Developer
    MAX_TASKS = 15

def work!
  raise(ArgumentError) if @task_array.empty?
   
    if rand(2) == 1
      2.times{
        puts  %Q{%s: выполнена задача "%s". Осталось задач: %i} %
          [@name_variable, @task_array.shift, @task_array.count]
          
      raise(ArgumentError) if @task_array.empty?}
    else
      puts 'Что-то лень'
    end

    rescue ArgumentError
      puts 'Нечего делать!'
  end

end  

