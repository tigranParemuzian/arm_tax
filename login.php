<?php
/**
 * Created by PhpStorm.
 * User: parem
 * Date: 12/19/16
 * Time: 9:36 PM
 */

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once('LoginController.php');

$data  = array();

if($_SERVER['REQUEST_METHOD'] === "POST"){

    $data = json_decode(file_get_contents('php://input'), true);
}else {
    $data = json_decode(urldecode($_SERVER['QUERY_STRING']), true);
}
//var_dump($data); exit;
if(isset($data['cmd']) && !empty($data['cmd'])) {

    $container = new LoginController();
    $result = '';
    $action = $data['cmd'];
    switch($action){
        case 'checkUser':
            $newData = $container->checkUser($data);
            $newData['cmd'] = 'checkUser';
            $result = json_encode($newData);
            break;
        case 'login':
            $newData = $container->loginAction($data);
            $newData['cmd'] = 'login';
            $result = json_encode($newData);
            break;
        case 'register':
            $newData = $container->putAction($data);
            $newData['cmd'] = 'register';
            $result = json_encode($newData);
            break;
        case 'insertData':
            $newData = $container->putAction($data);
            $newData['cmd'] = 'insertData';
            $result = json_encode($newData);
            break;
        case 'editData':
            $newData = $container->postAction($data);
            $newData['cmd'] = 'editData';
            $result = json_encode($newData);
            break;
        case 'showData':
            break;
        case 'deleteData':
            $newData = $container->deleteAction($data);
            $newData['cmd'] = 'deleteData';
            $result = json_encode($newData);
            break;
        default:
            $result = json_encode($container->getListAction());

    }

    echo $result;

}