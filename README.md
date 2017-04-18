# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-php-letsencrypt)

### SYMFONY  2.8 activation

#### comment

[handler_id](http://symfony.com/doc/current/reference/configuration/framework.html#handler-id)

> type: string default: 'session.handler.native_file'

> The service id used for session storage. The session.handler service alias will be set to this service id.

> You can also set it to null, to default to the handler of your PHP installation.

> You can see an example of the usage of this in How to Use PdoSessionHandler to Store Sessions in the Database.

The following session handler can generate issues.

##### app\config\config.yml



To avoid issues you can use one of these following solutions (only the default handler have been tested)

##### app\config\config.yml

default php handler



[memcached handler](https://github.com/symfony/symfony/issues/17845#issuecomment-195285004)



[PDO Handler](http://symfony.com/doc/current/doctrine/pdo_session_storage.html)




## LABEL

> dwl.app.framework="symfony 2.8"

