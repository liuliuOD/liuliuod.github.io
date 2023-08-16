FROM jekyll/jekyll

EXPOSE 4000

LABEL MAINTAINER=liuliuod

ARG OWNER=jekyll

WORKDIR /app

COPY --chown=$OWNER:$OWNER Gemfile* /app

USER root
RUN chown $OWNER:$OWNER /app
RUN bundle install
COPY --chown=$OWNER:$OWNER . /app

USER $OWNER
ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]
CMD ["--host", "0.0.0.0"]
