<?php
/**
 * Created by PhpStorm.
 * User: tigran
 * Date: 12/6/16
 * Time: 1:02 AM
 */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once ('ProductController.php');

$data  = array();

if($_SERVER['REQUEST_METHOD'] === "POST"){

    $data = json_decode(file_get_contents('php://input'), true);
}else {
    $data = json_decode(urldecode($_SERVER['QUERY_STRING']), true);
}

if(isset($data['cmd']) && !empty($data['cmd'])) {

    $container = new ProductController();
    $result = '';
    $action = $data['cmd'];
    switch($action){
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

