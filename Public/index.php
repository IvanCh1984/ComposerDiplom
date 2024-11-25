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

    $r->addRoute( httpMethod:'GET', route: '/register', handler: ['Controllers\RegistrationUserController', 'register']);
    $r->addRoute( httpMethod:'POST', route: '/registerUser', handler: ['Controllers\RegistrationUserController', 'registerUser']);

    //$r->addRoute(httpMethod:'GET', route:'/verification?selector&token', handler:['Controllers\RegistrationUserController', 'verificationUser']);
    

    $r->addRoute(httpMethod:'GET', route:'/login', handler:['Controllers\RegistrationUserController', 'login']);
    $r->addRoute(httpMethod:'POST', route:'/loginUser', handler:['Controllers\RegistrationUserController', 'loginUser']);
    $r->addRoute(httpMethod:'GET', route:'/logOut', handler:['Controllers\RegistrationUserController', 'logOut']);

    $r->addRoute(httpMethod:'GET', route:'/createUser', handler:['Controllers\CreateUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/insertUser', handler:['Controllers\CreateUserController', 'insertUser']);

    $r->addRoute(httpMethod:'GET', route:'/pageProfile', handler:['Controllers\PageProfileUserController', 'index']);

    $r->addRoute(httpMethod:'GET', route:'/edit', handler:['Controllers\EditUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/updateInfo', handler:['Controllers\EditUserController', 'updateInfo']);

    $r->addRoute(httpMethod:'GET', route:'/security', handler:['Controllers\SecurityUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/updateRegister', handler:['Controllers\SecurityUserController', 'updateRegister']);

    $r->addRoute(httpMethod:'GET', route:'/status', handler:['Controllers\StatusUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/editStatus', handler:['Controllers\StatusUserController', 'editStatus']);

    $r->addRoute(httpMethod:'GET', route:'/avatar', handler:['Controllers\AvatarUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/downloadAvatar', handler:['Controllers\AvatarUserController', 'downloadAvatar']);

    $r->addRoute(httpMethod:'GET', route:'/socialLinks', handler:['Controllers\SocialLnksUserController', 'index']);
    $r->addRoute(httpMethod:'POST', route:'/addSocialLinks', handler:['Controllers\SocialLnksUserController', 'addSocialLinks']);

    $r->addRoute(httpMethod:'GET', route:'/delete', handler:['Controllers\DeleteUserController', 'deleteUser']);
    
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