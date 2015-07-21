params = {adapter: 'sqlite3'}.tap do |t|
  if ENV['HOLIDAYS_ENV'] == 'test'
    t[:database] = ':memory:'
  else
    t[:database] = File.join(File.expand_path('../../../db', __FILE__), "holidays.db")
  end
end

ActiveRecord::Base.establish_connection(params)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'properties'
    create_table :properties, :id => false do |table|
      table.column :id, 	   			:string
      table.column :title,     			:string
      table.column :address,   			:string
      table.column :property_type, 	    :integer # 0 - , 1, 2
      table.column :rate,	   			:double
      table.column :guests,    			:integer
  	  table.column :email, 	   			:string
  	  table.column :phone, 	   			:string
  	  table.column :is_draft,  			:boolean, default: true
  	end
  end
end
