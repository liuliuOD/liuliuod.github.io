FROM jekyll/jekyll

EXPOSE 4000

LABEL MAINTAINER=liuliuod

COPY --chown=jekyll:jekyll . /app

WORKDIR /app

USER root

RUN bundle install

USER jekyll

ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]
CMD ["--host", "0.0.0.0"]
