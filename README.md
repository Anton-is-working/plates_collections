1. **Встановіть Ruby 3.0.0**:
  curl -sSL https://get.rvm.io | bash -s stable --ruby=3.0.0
 source ~/.rvm/scripts/rvm

2. **Встановіть Rails**:
  gem install rails -v 6.1.7

3. **Склонуйте проект**

4. **Встановлення залежностей**:
  bundle install

5. **Налаштування бази даних**:
  rails db:create
  rails db:migrate

6. **Запуск сервера**:
  rails s

7. **Запуск тестів**:
  bundle exec rspec
