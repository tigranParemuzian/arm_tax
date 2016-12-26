<?php
/**
 * Created by PhpStorm.
 * User: parem
 * Date: 12/19/16
 * Time: 9:23 PM
 */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once ('DatabaseBase.php');

$target_dir = "uploads/";
$data = array();
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);

$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
if($imageFileType == 'xml' && is_file($_FILES["fileToUpload"]["name"])){
    $file = $_FILES["fileToUpload"]["name"];

    $t = move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir.$file);
    $t = chmod($target_dir.$file, 0777);  //changed to add the zero
    $fileContents = file_get_contents($target_dir.$file);
    $simpleXml = simplexml_load_string($fileContents);

    $json = json_encode($simpleXml);
    $arrayXml = json_decode($json, TRUE);

    foreach ($arrayXml as $kay=>$item){
        switch ($kay){
            case 'Identification':
                $prefix = 'ident_';
                if(array_key_exists('Office_segment', $item)){

                    $data[$prefix.'tax_code']=$item['Office_segment']['Customs_clearance_office_code'];
                }
                if (array_key_exists('Type', $item)){
                    $data[$prefix.'type_declar']=$item['Type']['Type_of_declaration'];
                    $data[$prefix.'type_code']=$item['Type']['Declaration_gen_procedure_code'];
                }
                break;
            case 'Traders':
                $prefix = 'traders';
                if(array_key_exists('Exporter', $item)){

                    $data[$prefix.'tax_export']=$item['Exporter']['Exporter_name'];
                }
                if (array_key_exists('Consignee', $item)){
                    $data[$prefix.'type_cosig_code']=$item['Consignee']['Consignee_code'];
                }
                break;
            case 'General_information':
                $prefix = 'gi_';
                if(array_key_exists('Country', $item)){

                    $data[$prefix.'tax_country']=$item['Country']['Trading_country'];
                    if (array_key_exists('Export', $item['Country'])){
                        $data[$prefix.'type_export']=$item['Country']['Export']['Export_country_code'];
                        $data[$prefix.'type_export_cname']=$item['Country']['Export']['Export_country_name'];
                    }
                    if (array_key_exists('Destination', $item['Country'])){
                        $data[$prefix.'type_destination_code']=$item['Country']['Destination']['Destination_country_code'];

                    }
                    if (array_key_exists('Country_of_origin_name', $item['Country'])){
                        $data[$prefix.'type_export']=$item['Country']['Country_of_origin_name'];
                    }
                }

                break;
            case 'Transport':
                $prefix = 'transport_';
                if(array_key_exists('Means_of_transport', $item) && array_key_exists('Border_information', $item['Means_of_transport'])){
                    isset($item['Means_of_transport']['Border_information']['Identity'])? $data[$prefix.'transport_identity']=$item['Means_of_transport']['Border_information']['Identity']:'';
                    isset($item['Means_of_transport']['Border_information']['Nationality'])? $data[$prefix.'transport_nation']=$item['Means_of_transport']['Border_information']['Nationality']:'';
                    isset($item['Means_of_transport']['Border_information']['Mode'])?$data[$prefix.'transport_mode']=$item['Means_of_transport']['Border_information']['Mode']:'';
                    isset($item['Means_of_transport']['Inland_mode_of_transport'])?$data[$prefix.'inland_transport_mode']=$item['Means_of_transport']['Inland_mode_of_transport']:'';
                }
                if(array_key_exists('Delivery_terms', $item)){
                    isset($item['Delivery_terms']['Code']) ? $data[$prefix.'delivery_term_code'] = $item['Delivery_terms']['Code'] : '';
                    isset($item['Delivery_terms']['Place']) ? $data[$prefix.'delivery_term_place'] = $item['Delivery_terms']['Place'] : '';
                }
                if(array_key_exists('Border_office', $item)){
                    isset($item['Border_office']['Code']) ? $data[$prefix.'border_office_code'] = $item['Border_office']['Code'] : '';'';
                }

                break;
            case 'Valuation':
                $prefix = 'valuation_';
                if(array_key_exists('Gs_Invoice', $item)){
                    isset($item['Gs_Invoice']['Currency_code'])? $data[$prefix.'gs_invoice_currency_code']=$item['Gs_Invoice']['Currency_code']:'';
                    isset($item['Gs_Invoice']['Currency_rate'])? $data[$prefix.'gs_invoice_currency_rate']=$item['Gs_Invoice']['Currency_rate']:'';
                }
                if(array_key_exists('Total', $item)){
                    isset($item['Total']['Total_invoice'])? $data[$prefix.'gs_invoice_total_invoice']=$item['Total']['Total_invoice']:'';
                    isset($item['Total']['Total_weight'])? $data[$prefix.'gs_invoice_total_weight']=$item['Total']['Total_weight']:'';
                }
                break;
            /**
             * TODO items begin *******
             */
            case 'Item':
                $prefix = 'items_';
                for ($i = 0; $i<=count($item); $i++){
                    $data[$prefix.$i] = $item[$i];
                }
                break;
            case 'Customs_Fee':
                $prefix = 'custom_fee';
                $data[$prefix]= $item['Customs_Fee'];
                break;
            default:
                break;
        }
    }

}
var_dump($data); exit;
$sql = "ALTER TABLE booking ";
$i = 0;
foreach ($data as $kay=>$values){
    if(strpos($kay, 'item') !==false){

    }else{
        $i===0 ? $sql .=" ADD COLUMN {$kay} VARCHAR(255) DEFAULT ''" : $sql .=", ADD COLUMN {$kay} VARCHAR(255) DEFAULT ''";
    }
    $i++;
}

$db = new DatabaseBase();
$connection = $db->connect();
$connection->exec($sql);
var_dump($sql); exit;
