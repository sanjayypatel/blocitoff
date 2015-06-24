every 1.day, :at => '7:30 pm' do
  rake "todo:delete_items"
end