FROM rails:onbuild
RUN echo "date: `date`" > ./config/version.yml
RUN echo "revision: `git show-ref --heads --hash`" >> ./config/version.yml
CMD ["rails", "server"]
