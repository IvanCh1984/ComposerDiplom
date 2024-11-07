<?php 

if ( ! session_id () ) {
    session_start ();
}

require '../vendor/autoload.php';
require '../settings.php';

use Delight\Auth\Auth;
use DI\ContainerBuilder;
use League\Plates\Engine;
use Aura\SqlQuery\QueryFactory;
use Database\Connection;

$containerbuilder = new ContainerBuilder();

$containerbuilder -> addDefinitions([

    Engine::class => function() {
        return new Engine("../views/");
    },

    Auth::class => function() {
        return new Auth(Connection::getInstance());
    },

    QueryFactory::class => function() {
        return new QueryFactory('mysql');
    }
    
]);

$container = $containerbuilder -> build();

$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) {

    $r->addRoute( httpMethod:'GET', route: '/', handler: ['Controllers\HomeController', 'index']);

    $r->addRoute( httpMethod:'POST', route: '/registerUser', handler: ['Controllers\RegistrationUserController', 'registerUser']);

    //$r->addRoute(httpMethod:'GET', route:'/registerUserverification/{selector:.+}/{token:.+}', handler:['App\Controllers\RegistrationUserController', 'verificationUser']);
    //$r->addRoute(httpMethod:'GET', route:'/verification', handler:['App\Controllers\RegistrationUserController', 'verificationUser']);

    $r->addRoute(httpMethod:'GET', route:'/login', handler:['Controllers\RegistrationUserController', 'login']);

    $r->addRoute(httpMethod:'POST', route:'/loginUser', handler:['Controllers\RegistrationUserController', 'loginUser']);
    $r->addRoute(httpMethod:'GET', route:'/logOut', handler:['Controllers\RegistrationUserController', 'logOut']);

    $r->addRoute(httpMethod:'GET', route:'/users', handler:['Controllers\ShowUserController', 'index']);

    //$r->addRoute('GET', '/users', 'get_all_users_handler');
    // {id} must be a number (\d+)
    //$r->addRoute('GET', '/user/{id:\d+}', 'get_user_handler');
    // The /{title} suffix is optional
    //$r->addRoute('GET', '/articles/{id:\d+}[/{title}]', 'get_article_handler');
});

$httpMethod = $_SERVER['REQUEST_METHOD'];
$uri = $_SERVER['REQUEST_URI'];

if (false !== $pos = strpos($uri, '?')) {
    $uri = substr($uri, 0, $pos);
}
$uri = rawurldecode($uri);

$routeInfo = $dispatcher->dispatch($httpMethod, $uri);
switch ($routeInfo[0]) {
    case FastRoute\Dispatcher::NOT_FOUND:
        break;
    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
        $allowedMethods = $routeInfo[1];
        break;
    case FastRoute\Dispatcher::FOUND:
        $handler = $routeInfo[1];
        $vars = $routeInfo[2];
        
        $container -> call($routeInfo[1], $routeInfo[2]);
        break;
}

?>