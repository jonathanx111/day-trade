class User < ActiveRecord::Base
    has_many :games
    has_many :spis, through: :games
    @@prompt = TTY::Prompt.new 
    
    def self.signup
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        self.create(username: username, password: password)
    end

    def self.login
        username = @@prompt.ask("What is your name?")
        password = @@prompt.mask("What is your password?")
        self.find_by(username: username, password: password)
    end

    def high_scores
        self_new = Game.all.select{|g| g.user_id == self.id}
                final = self_new.map{|g| g.user_balance}
                    puts "High Score: $" + final[0].to_s
    end 

    def leaderboard
        new = Game.all.group_by{|g| g.user_balance}.max(10)
                first_id = Game.all.group_by{|g| g.user_balance}.max(10)[0][1][0][:user_id]
                second_id = Game.all.group_by{|g| g.user_balance}.max(10)[1][1][0][:user_id]
                third_id = Game.all.group_by{|g| g.user_balance}.max(10)[2][1][0][:user_id]
                fourth_id = Game.all.group_by{|g| g.user_balance}.max(10)[3][1][0][:user_id]
                fifth_id = Game.all.group_by{|g| g.user_balance}.max(10)[4][1][0][:user_id]
                sixth_id = Game.all.group_by{|g| g.user_balance}.max(10)[5][1][0][:user_id]
                seven_id = Game.all.group_by{|g| g.user_balance}.max(10)[6][1][0][:user_id]
                eight_id = Game.all.group_by{|g| g.user_balance}.max(10)[7][1][0][:user_id]
                nine_id = Game.all.group_by{|g| g.user_balance}.max(10)[8][1][0][:user_id]
                tenth_id = Game.all.group_by{|g| g.user_balance}.max(10)[9][1][0][:user_id]
                name1 = User.find(first_id).username
                name2 = User.find(second_id).username
                name3 = User.find(third_id).username
                name4 = User.find(fourth_id).username
                name5 = User.find(fifth_id).username
                name6 = User.find(sixth_id).username
                name7 = User.find(seven_id).username
                name8 = User.find(eight_id).username
                name9 = User.find(nine_id).username
                name10 = User.find(tenth_id).username

                puts "1) #{name1}: $" + new[0][0].to_s
                puts "2) #{name2}:  $" + new[1][0].to_s
                puts "3) #{name3}:  $" + new[2][0].to_s
                puts "4) #{name4}:  $" + new[3][0].to_s
                puts "5) #{name5}:  $" + new[4][0].to_s
                puts "6) #{name6}:  $" + new[5][0].to_s
                puts "7) #{name7}:  $" + new[6][0].to_s
                puts "8) #{name8}:  $" + new[7][0].to_s
                puts "9) #{name9}:  $" + new[8][0].to_s
                puts "10) #{name10}:  $" + new[9][0].to_s
                
    end 
end