require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true 
    self.results_as_hash = true
  end
end



class User
    attr_reader :id , :fname , :lname
    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum) }
    end
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(i_user, users)

        self.all.each do |user| 
            return user if user.id == i_user
        end
        nil

    end
    def self.find_by_name(first_name, last_name)
        self.all.each do |user|
            return user if user.fname == first_name && user.lname == last_name
        end
        nil
    end
end

class Question
    def initialize
        
    end
    def self.find_by_id

    end
end

class QuestionFollow
    def initialize

    end
    def self.find_by_id

    end
end

class Reply
    def initialize

    end
    def self.find_by_id

    end
end


class QuestionLike
    def initialize

    end
    def self.find_by_id

    end
end



