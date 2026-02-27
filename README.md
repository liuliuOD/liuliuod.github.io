
# Jekyll
Jekyll is a popular static site generator. Can use to further customize your GitHub Pages site.

## How to init Jekyll project
```shell
$ gem install jekyll bundler
$ jekyll new --skip-bundle .
```

## How to run existed Jekyll project
```shell
$ make install
$ make serve
```

## Run by Docker
```shell
$ make docker-up
# this app will serve at port 4000
```

Other Docker targets:
```shell
$ make docker-logs     # tail logs
$ make docker-restart  # restart container
$ make docker-down     # stop/remove containers
```

## References

### Resume
- [Online CV shared by Sharu725](https://github.com/sharu725/online-cv)
- [SEO with Jekyll](https://github.com/jekyll/jekyll-seo-tag)
- [Useful QR Code Generator](https://qr.ioi.tw)
