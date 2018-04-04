class ChangeCallsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :recording_url, :string
    add_column :calls, :call_sid, :string
    add_column :calls, :recording_duration, :integer
    add_column :calls, :option, :string
    add_reference :calls, :caller, index: true
  end
end
