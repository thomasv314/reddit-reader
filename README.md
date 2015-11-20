# reddit-reader
Parses reddit RSS feeds

### Running development  (with pow.cx) on a Mac:
- `bundle install`
- `bundle exec rake db:migrate`
- `gem install powder`
- `powder install` (if pow.cx isn't already installed)
- `powder link`
- `powder open`

### Running production (with docker and docker-compose v1.8+) on anything:
- `docker-compose build`
- `docker-compose run web rake db:migrate`
- `docker-compose up` 
- After running `docker-compose up` you will have an App and MySQL container running. The app port gets exposed to :83 by default, you can see a sample of how to proxy pass http requests from nginx using `reddit-nginx.conf`

### Running tests 
- Use `bundle exec rake test` to run minitest
- Or use `bundle exec guard` to have Guard watch for changes and run tests for you
