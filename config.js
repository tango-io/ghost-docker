// # Ghost Configuration
// Setup your Ghost install for various environments
// Documentation can be found at http://support.ghost.org/config/

var config;

function getServer(){
  return {
            host: '0.0.0.0',
            port: process.env['SERVER_PORT']
        }
}

function getDb(){
  if (process.env['DB_CLIENT']) {
    var config = {
      client: process.env['DB_CLIENT'],
      connection: {
        host     : process.env['DB_HOST'],
        user     : process.env['DB_USER'],
        password : process.env['DB_PASSWORD'],
        database : process.env['DB_DATABASE'],
        charset  : process.env['DB_CHARSET']
      }
    }
  } else {
    var config = {
      client: 'sqlite3',
      connection: {
        filename: process.env['DB_PATH']
      },
      debug: false
    }
  }
  return config;
}


function getMail(){
  if (process.env['MAIL_TRANSPORT']) {
    var config = {
	mail: {
      transport: process.env['MAIL_TRANSPORT'],
      host: process.env['MAIL_HOST'],
      options: {
        port: process.env['MAIL_PORT'],
        service: process.env['MAIL_SERVICE'],
        auth: {
          user: process.env['MAIL_USER'],
          pass: process.env['MAIL_PASS']
        }
      }
    }
}
  } else {
    var config = {
      client: 'sqlite3',
      connection: {
        filename: path.join(__dirname, '/content/data/ghost.db')
      },
      debug: false
    }
  }
  return config;
}


config = {
    development: {
        url: process.env['GHOST_URL'],
        database: getDb(),
        server: getServer(),
        paths: {
          contentPath: process.env['CONTENT_PATH']
        }
    },

    production: {
        url: process.env['GHOST_URL'],
        database: getDb(),
        server: getServer(),
        paths: {
          contentPath: process.env['CONTENT_PATH']
        }

    }
};

// Export config
module.exports = config;
