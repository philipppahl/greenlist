namespace :db do
  desc "Fill database with sample items"
  task populate: :environment do
    make_items
  end
end


def make_items
  File.open('lib/tasks/sample_data.txt').each_line do |item_name|
    name = item_name
    status = 'yellow'
    Item.create!(name: name, status: status)
  end
end
