<?php
require dirname(__DIR__).'/config/bootstrap.php';
$kernel = new \App\Kernel($_SERVER['APP_ENV'], (bool) $_SERVER['APP_DEBUG']);
$kernel->boot();
$container = $kernel->getContainer();
if (!is_null($container)) {
    /** @var \Doctrine\Bundle\DoctrineBundle\Registry $registry */
    $registry = $container->get('doctrine');
    return $registry->getManager();
}
