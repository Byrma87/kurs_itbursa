require 'pry'

class Developer

  attr_reader :name, :task_array
  MAX_TASKS = 10
  def initialize(name_obj)
    @name = name_obj
    @task_array = []
  end

  def add_task(name_task)
    raise(ArgumentError) if MAX_TASKS <= @task_array.length

    @task_array << name_task

    puts %Q{%s: добавлена задача "%s". Всего в списке задач: %i} %
        [@name, name_task, @task_array.count]
    rescue ArgumentError
      puts 'Слишком много работы!'
  end

  def tasks
    @task_array.each_with_index.map{|val, i| "#{val}"}
    # binding.pry
  end

  def work!
    raise("Нечего делать!") if @task_array.empty?

      puts  %Q{%s: выполнена задача "%s". Осталось задач: %i} %
        [@name, @task_array.shift, @task_array.count]

    raise("Нечего делать!") if @task_array.empty?
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
    @task_array.count < self.class::MAX_TASKS
  end

  def can_work?
    !@task_array.count.zero?
  end

  def dev_type
    case
      when self.class.to_s == "SeniorDeveloper"
        :senior
      when self.class.to_s == 'Developer'
        :developer
      else
        :junior
    end
  end

  def dev_types
    case
      when self.class.to_s == "SeniorDeveloper"
        :seniors
      when self.class.to_s == 'Developer'
        :developers
      else
        :juniors
    end
  end

  def dev_typ
    case 
      when self.class.to_s == "SeniorDeveloper"
        'senior'
      when self.class.to_s == 'Developer'
        'developer'
      else
        'junior'
    end
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
        [@name, name_task, @task_array.count]

    rescue ArgumentError
      puts 'Слишком много работы!'

    rescue RuntimeError
      puts 'Слишком сложно!'
  end

  def work!

    raise(ArgumentError) if @task_array.empty?

      puts  %Q{%s: пытаюсь делать задачу "%s". Осталось задач: %i} %
        [@name, @task_array.shift, @task_array.count]

    raise(ArgumentError) if @task_array.empty?

    rescue ArgumentError
      puts 'Нечего делать!'
  end
end



class SeniorDeveloper < Developer
  attr_reader :my_var
  MAX_TASKS = 15
  @my_var = :senior
  def work!
    raise(ArgumentError) if @task_array.empty?
    if rand(2) == 1
      2.times{
        puts  %Q{%s: выполнена задача "%s". Осталось задач: %i} %
          [@name, @task_array.shift, @task_array.count]

      raise(ArgumentError) if @task_array.empty?}
    else
      puts 'Что-то лень'
    end
    rescue ArgumentError
      puts 'Нечего делать!'
  end
end



class Team 

  attr_accessor :team_dev, :dev_priority, :on_task_var

  def initialize (&mybloc)
    @on_task_var = {}
    @team_dev = []
    instance_eval &mybloc
  end
  
  def have_juniors(*names)
    @team_dev << names.map{|i| JuniorDeveloper.new(i)}
  end

  def have_developers(*names)
    @team_dev << names.map{|i| Developer.new(i)}
  end

  def have_seniors(*names)
    @team_dev.push(names.map{|i| SeniorDeveloper.new(i)})
  end

  def priority (*var)
    @dev_priority = var
  end

  def add_task (task)
    @team_dev.flatten! 
    @var = @team_dev.sort_by{|dev| [dev.task_array.size, @dev_priority.index(dev.dev_types)]}
    @var[0].add_task(task)

     if @on_task_var.has_key?(@var[0].dev_type)
      @on_task_var[@var[0].dev_type].call(@var[0], task)
    end
  end

  def seniors
    @team_dev.select{|i| i.dev_types == :seniors }
  end

  def juniors
    @team_dev.select{|i| i.dev_types == :juniors }
  end

  def developers
    @team_dev.select{|i| i.dev_types == :developers }
  end

  def all
    @team_dev
  end

  def report
    @team_dev.flatten! 
    @var = @team_dev.sort_by{|dev| [dev.task_array.size, @dev_priority.index(dev.dev_types)]}
    @var.map { |e| puts "#{e.name} (#{e.dev_typ}): #{e.task_array.join(",")}" }
  end

  private

  def on_task(type, &block)
    @on_task_var[type] = block
  end
end



team = Team.new do
  # создаём команду, описываем её в этом блоке

  # описываем, какие в команде есть разработчики
  have_seniors "Олег", "Оксана"
 have_developers "Олеся", "Василий", "Игорь-Богдан"
have_juniors "Владислава", "Аркадий", "Рамеш"
  # описываем в каком порядке выдавать задачи:
  # * сначала любому джуниору
  # * потом любому обычному разработчику
  # * потом любому старшему
  priority :juniors, :developers, :seniors

  # описываем дополнительные действия, когда задача выдана джуну
  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end

   # ...и так можно для любого типа разработчиков описать, например:
  on_task :senior do |dev, task|
    puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать"
  end
end 
10.times.map { |e| team.add_task("#{e}")}
p team.team_dev
# team.team_dev[0].add_task('10')
binding.pry

