# Ghost docker image

This docker image allows you to run a ghost on production or development
You can change it with `NODE_ENV` in development or production

Also you can change the database. By default it uses sqlite


```
DB_HOST     '127.0.0.1',
DB_USER     'postgres',
DB_PASSWORD '',
DB_DATABASE 'ghost_testing',
DB_CHARSET  'utf8'
```

# Setting up email

You can change mail setting with

```
MAIL_TRANSPORT SMTP
MAIL_HOST 'your-ses-server-name'
MAIL_PORT 465
MAIL_SERVICE 'SES'
MAIL_USER 'ACCESS KEY'
MAIL_PASS 'SECRET ACCESS'
```

# How to run this image

```
docker run -v /path/to/content:/content -p 2368:2368 framallo/ghost
```
