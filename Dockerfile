FROM rails:onbuild
RUN echo "date: `date`" > ./config/version.yml
#RUN echo "revision: `git show-ref --heads --hash`" >> ./config/version.yml
RUN bundle exec rake db:setup
CMD ["rails", "server"]
