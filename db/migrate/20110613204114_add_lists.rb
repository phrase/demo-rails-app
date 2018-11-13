class AddLists < ActiveRecord::Migration
  
  class List < ActiveRecord::Base
    has_many :tasks
  end

  class Task < ActiveRecord::Base
    belongs_to :list
  end
  

  def self.up
    list = List.create(:name => 'Welcome')
    list.tasks.create(:name => 'Check out our docs https://help.phraseapp.com/')
    list.tasks.create(:name => 'Rock on!')
  end

  def self.down
    List.find_by_name('Test').destroy
  end
end
