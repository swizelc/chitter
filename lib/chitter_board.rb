require 'pg'
require_relative 'chitter_board'
require_relative 'database_connection'
class Chitter_board 
    
    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps;")
        result.map do |peep|
          Peep.new(peep['id'], peep['message'], peep['user_id'])
        end
    end
    
    def self.add(peep, user_id)
        DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES ('#{peep}', '#{user_id}');")
        true
    end

    def self.delete(id:)
        DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}';")
        true
    end

end
