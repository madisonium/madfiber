namespace :google do
  desc 'import spreadsheet data from original site'
  task :import => :environment do
    require 'csv'
    newest = Dir["#{Rails.root}/doc/*.csv"].sort do |a, b|
      File.mtime(a) <=> File.mtime(b)
    end.first
    counter = 0
    CSV.foreach(newest, :headers => true) do |row|
      pin = Pin.new(:name => row[1], :address => row[2])
      pin.created_at = row[0] if row[0].present?
      if pin.save_without_geocoding
        $stdout.print('.')
        counter += 1
      else
        puts(pin.errors)
      end
    end unless newest.blank?
    puts ''
    puts "#{counter} pins created"
  end
end
