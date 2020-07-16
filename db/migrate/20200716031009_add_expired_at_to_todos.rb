class AddExpiredAtToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :expired_at, :datetime
  end
end
