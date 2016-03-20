# set :output, "log/test.log"

every 1.day, :at => '0:01 am' do 
# every 5.minutes do 
  rake "petitions:check_old"

end