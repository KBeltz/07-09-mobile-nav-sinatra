require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Cyclist
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  

  attr_accessor :first_name, :last_name, :nickname
  attr_reader :id

  # Initializes a new Cyclist object
  #
  # id         - Integer id primary key created in the 'cyclists' table
  # first_name - String containing the first name of the cyclist
  # last_name  - String containing the last name of the cyclist
  # nickname   - (optional) String containing the nickname of the cyclist
  #
  # Returns a Cyclist object
  
  def initialize(options = {})
    
    # Example: {"id" => 1, "first_name" => "Johnny", "last_name" => "Doe", "nickname" => "JohnBikes"}
    @id = options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @nickname = options["nickname"]
 
  end
  
  # method to validate cyclist profiles before they are added to the database
  #
  # name1 - String containing the first name of the cyclist being added
  # name2 - String containing the last name of the cyclist being added
  #
  # Returns boolean
  def self.valid?(name1, name2)
    if name1.empty? || name2.empty?
      true
    end
  end
  
  # Get all bikes owned by a specific cyclist.
  #
  # Return 
  def bikes_owned
    DATABASE.execute("SELECT bikes.bike_name FROM bikes JOIN cyclists ON bikes.cyclist_id = cyclists.id WHERE cyclists.id = #{id}")
  end
  
end
