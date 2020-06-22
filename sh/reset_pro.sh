cd current
rails db:migrate:reset RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1
cd current
rails db:seed RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1