namespace :scrapers do
  desc 'Scrape coins info'
  task scrape_coins_info: :environment do
    StoreCoinsJob.perform_later
  end
end
