class ConvertLessons < ActiveRecord::Migration
  def change
    # for each table that will store unicode execute:
    execute "ALTER TABLE lessons CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci"
  end
end