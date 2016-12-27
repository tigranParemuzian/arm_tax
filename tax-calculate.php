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
header("Content-Type: text/plain; charset: UTF-8;");
require_once ('DatabaseBase.php');

$db = new DatabaseBase();

$connection = $db->connect();
if(!$connection){

    throw new HttpException('aaa', 500);
}
$now = new DateTime();
$now = $now->format('Y-m-d H:i:s');

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
                    if(isset($item[$i]) && is_array($item[$i]) && count($item[$i])!=0){
                        $data[$prefix.$i] = $item[$i];
                    }

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
//var_dump($data); exit;
/*foreach ($data as $kay=>$values){
if(strpos($kay, 'items_') !==false){
    var_dump($data[$kay]);
}
}
exit;*/

//$sqlHeaderInsert = "INSERT INTO `header`(`id`, `booking_id`) VALUES ([value-1],[value-2])";

$h = 0;
$f = 0;
$header = array();
$footer = array();
$items = array();
foreach ($data as $kay=>$values){
    if(strpos($kay, 'item') !==false || strpos($kay, 'custom_fee') !==false){
            if(strpos($kay, 'custom_fee') !==false && is_array($data[$kay])){
                $footer = $data[$kay];
            }
        elseif(strpos($kay, 'items_') !==false){
            $items[]=$data[$kay];
        }
    }else{
        $kay = strtolower(str_replace(array(';', ':', ' ', '.'),'_',$kay));
        $header[$kay]=$values;
    }

}

$bookingId = insertBooking();
insertHeader($header);
insertFooter($footer);
foreach($items as $kay=>$item){
    insertItem($item);
}



/**
 * Insert Booking
 * @return int
 */
function insertBooking(){
    global $connection, $now;

    $status = 1;
    $userId = 1;

    $newBoking = $connection->prepare('INSERT INTO booking(user_id, created, updated, status) VALUES (:u_id, :c, :u, :s)');
    $newBoking->bindParam(':u_id', $userId);
    $newBoking->bindParam(':c', $now);
    $newBoking->bindParam(':u', $now);
    $newBoking->bindParam(':s', $status);
    $newBoking->execute();

    $id = (int)$connection->lastInsertId();
    try{
        $newBoking->execute();
        $connection->commit();

    }catch (Exception $e){
        //todo add inf in log
    };

    return $id;
}

/**
 * Insert Header
 * @param $data
 * @return int
 */
function insertHeader($data){

    global $connection, $bookingId;
    $insertHeader = '';

    $tables = '';
    $valuesSql = '';
    $i = 0;
    foreach($data as $kay=>$value){
        $i ===0 ? $tables = 'INSERT INTO header (booking_id,' . $kay . ', ' : $tables .= $kay . ', ';
        $i ===0 ? $valuesSql = ')  VALUES (:booking_id, :' . $kay . ', ': $valuesSql .= ':'.$kay .', ';
        $i++;
    }

    $insertHeader .= substr($tables, 0, -2) . substr($valuesSql, 0, -2) . ')';

    $newHeader = $connection->prepare(
            $insertHeader
    );

    $newHeader->bindParam(':booking_id', $bookingId);
    foreach($data as $kay=>$value){
        $newHeader->bindParam(':'.$kay, $value);
    }

    $newHeader->execute();

    $id = (int)$connection->lastInsertId();
    try{
        $connection->commit();

    }catch (Exception $e){
        //todo add inf in log
    };

    return $id;

}

/**
 * Inssert Footer
 * @param $data
 * @return int
 */
function insertFooter($data){
    global $connection, $bookingId;
    $tables = '';
    $valuesSql = '';
    $sqlInsert = '';
    $i = 0;
    foreach($data as $kay=>$value){
        $insertKay = $kay+1;
        $i ===0 ? $tables = 'INSERT INTO footer (booking_id,' . 'fee_amount_' . $insertKay . ', ' : $tables .= 'fee_amount_'.$insertKay . ', ';
        $i ===0 ? $valuesSql = ')  VALUES (:booking_id, :' . 'fee_amount_'. $insertKay . ', ': $valuesSql .= ':'.'fee_amount_'.$insertKay .', ';
        $i++;
    }

    $sqlInsert .= substr($tables, 0, -2) . substr($valuesSql, 0, -2) . ')';

    $newFooter = $connection->prepare(
        $sqlInsert
    );


    $newFooter->bindParam(':booking_id', $bookingId);
    foreach($data as $kay=>$value){
        $insertKay = $kay+1;
        $newFooter->bindParam(':fee_amount_'.$insertKay, $value['Fee_Amount']);
    }


    $newFooter->execute();

    $id = (int)$connection->lastInsertId();
    try{
        $connection->commit();

    }catch (Exception $e){
        //todo add inf in log
    };

    return $id;
}

/**
 * @param $date
 * @return int
 */
function insertItem($date){

    global $connection, $now, $bookingId;

    $sqlItem = '';
    $sqlItemInsert = 'INSERT INTO item(booking_id';
    $sqlItemValue = ')VALUES (:booking_id';

    if(isset($date['Packages']) && isset($date['Packages']['Number_of_packages'])){
        $sqlItemInsert.= ', number_of_packages';
        $sqlItemValue .=', :number_of_packages';
        $number_of_packages = (int)$date['Packages']['Number_of_packages'];
    }

    if(isset($date['Packages']) && isset($date['Packages']['Kind_of_packages_name'])){
        $sqlItemInsert.= ', kind_of_packages_code';
        $sqlItemValue .=', :kind_of_packages_code';
        is_array($date['Packages']['Kind_of_packages_name'])? $kind_of_packages_code = json_encode($date['Packages']['Kind_of_packages_name']) : $kind_of_packages_code = $date['Packages']['Kind_of_packages_name'];
    }

    if(isset($date['Packages']) && isset($date['Packages']['Kind_of_packages_code'])){
        $sqlItemInsert.= ', kind_of_packages_name';
        $sqlItemValue .=', :kind_of_packages_name';
        is_array($date['Packages']['Kind_of_packages_name'])? $kind_of_packages_name = json_encode($date['Packages']['Kind_of_packages_code']) : $kind_of_packages_name = $date['Packages']['Kind_of_packages_code'];
    }

    if(isset($date['Goods_description']) && isset($date['Goods_description']['Kind_of_packages_code'])){
        $sqlItemInsert.= ', country_of_origin_code';
        $sqlItemValue .=', :country_of_origin_code';
        is_array($date['Packages']['Kind_of_packages_code']) ? $country_of_origin_code = json_encode($date['Packages']['Kind_of_packages_code']) : $country_of_origin_code = $date['Packages']['Kind_of_packages_code'];
    }
    if(isset($date['Goods_description']) && isset($date['Goods_description']['Specification_Code_Description'])){
        $sqlItemInsert.= ', specification_code_description';
        $sqlItemValue .=', :specification_code_description';
        is_array($date['Goods_description']['Specification_Code_Description'])? $specification_code_description = json_encode($date['Goods_description']['Specification_Code_Description']) : $specification_code_description = $date['Goods_description']['Specification_Code_Description'];
    }
    if(isset($date['Previous_doc']) && isset($date['Previous_doc']['Summary_declaration'])){
        $sqlItemInsert.= ', summary_declaration';
        $sqlItemValue .=', :summary_declaration';
        is_array($date['Previous_doc']['Summary_declaration']) ? $summary_declaration = json_encode($date['Previous_doc']['Summary_declaration']) : $summary_declaration = $date['Previous_doc']['Summary_declaration'];
        ;
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Weight_itm']) && isset($date['Valuation_item']['Weight_itm']['Gross_weight_itm'])){
        $sqlItemInsert.= ', gross_weight_itm';
        $sqlItemValue .=', :gross_weight_itm';
        is_array($date['Valuation_item']['Weight_itm']['Gross_weight_itm'])? $gross_weight_itm = json_encode($date['Valuation_item']['Weight_itm']['Gross_weight_itm']) : $gross_weight_itm = (float)$date['Valuation_item']['Weight_itm']['Gross_weight_itm'];
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Weight_itm']) && isset($date['Valuation_item']['Weight_itm']['Net_weight_itm'])){
        $sqlItemInsert.= ', net_weight_itm';
        $sqlItemValue .=', :net_weight_itm';
        is_array($date['Valuation_item']['Weight_itm']['Net_weight_itm'])? $net_weight_itm = json_encode($date['Valuation_item']['Weight_itm']['Net_weight_itm']) :$net_weight_itm = (float)$date['Valuation_item']['Weight_itm']['Net_weight_itm'];
        ;
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Total_cost_itm'])){
        $sqlItemInsert.= ',total_cost_itm';
        $sqlItemValue .=',:total_cost_itm';
        is_array($date['Valuation_item']['Total_cost_itm'])? $total_cost_itm = json_encode($date['Valuation_item']['Total_cost_itm']):$total_cost_itm = (string)$date['Valuation_item']['Total_cost_itm'];
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Total_CIF_itm'])){
        $sqlItemInsert.= ',total_cif_itm';
        $sqlItemValue .=', :total_cif_itm';
        is_array($date['Valuation_item']['Total_CIF_itm'])? $total_cif_itm = json_encode($date['Valuation_item']['Total_CIF_itm']): $total_cif_itm = (string)$date['Valuation_item']['Total_CIF_itm'];
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Rate_of_adjustement'])){
        $sqlItemInsert.= ', rate_of_adjustement';
        $sqlItemValue .=', :rate_of_adjustement';
        is_array($date['Valuation_item']['Rate_of_adjustement']) ? $rate_of_adjustement = json_encode($date['Valuation_item']['Rate_of_adjustement']) : $rate_of_adjustement = (string)$date['Valuation_item']['Rate_of_adjustement'];
    }
    if(isset($date['Valuation_item']) && isset($date['Valuation_item']['Statistical_value'])){
        $sqlItemInsert.= ', statistical_value';
        $sqlItemValue .=', :statistical_value';
        is_array($date['Valuation_item']['Statistical_value'])? $statistical_value = json_encode($date['Valuation_item']['Statistical_value']): $statistical_value = (string)$date['Valuation_item']['Statistical_value'];
    }

    $sqlItem.= $sqlItemInsert . $sqlItemValue.')';

    $newItem = $connection->prepare($sqlItem);

    $newItem->bindParam(':booking_id', $bookingId);
    isset($number_of_packages)? $newItem->bindParam(':number_of_packages', $number_of_packages):'';
    isset($kind_of_packages_code)? $newItem->bindParam(':kind_of_packages_code', $kind_of_packages_code):'';
    isset($kind_of_packages_name)? $newItem->bindParam(':kind_of_packages_name', $kind_of_packages_name):'';
    isset($country_of_origin_code)? $newItem->bindParam(':country_of_origin_code', $country_of_origin_code):'';
    isset($specification_code_description)? $newItem->bindParam(':specification_code_description', $specification_code_description):'';
    isset($summary_declaration)? $newItem->bindParam(':summary_declaration', $summary_declaration):'';
    isset($gross_weight_itm)? $newItem->bindParam(':gross_weight_itm', $gross_weight_itm):'';
    isset($net_weight_itm)? $newItem->bindParam(':net_weight_itm', $net_weight_itm):'';
    isset($total_cost_itm)? $newItem->bindParam(':total_cost_itm', $total_cost_itm):'';
    isset($total_cif_itm)? $newItem->bindParam(':total_cif_itm', $total_cif_itm):'';
    isset($rate_of_adjustement)? $newItem->bindParam(':rate_of_adjustement', $rate_of_adjustement):'';
    isset($statistical_value)? $newItem->bindParam(':statistical_value', $statistical_value):'';

    $newItem->execute();

    $itemId = (int)$connection->lastInsertId();
    try{
        $newItem->execute();
        $connection->commit();

    }catch (Exception $e){
        //todo add inf in log
    };






    if(isset($date['Attached_documents']) && is_array($date['Attached_documents']) && count($date['Attached_documents'])>0){

    } elseif(isset($date['Tarification']) && is_array($date['Tarification']) && count($date['Tarification'])>0){

        $insertTarif = 'INSERT INTO tarification(item_id';
        $insertTarifVal = ') VALUES (:item_id';

        if(isset($date['Tarification']['HScode']) && isset($date['Tarification']['HScode']['Commodity_code'])){
            $insertTarif.= ',h_scode_commodity_code';
            $insertTarifVal .=', :h_scode_commodity_code';
            is_array($date['Tarification']['HScode']['Commodity_code']) ? $h_scode_commodity_code = json_encode($date['Tarification']['HScode']['Commodity_code']) :$h_scode_commodity_code = $date['Tarification']['HScode']['Commodity_code'];

        }
        if(isset($date['Tarification']['HScode']) && isset($date['Tarification']['HScode']['Precision_1'])){
            $insertTarif.= ', h_scode_precision_1';
            $insertTarifVal .=', :h_scode_precision_1';
            is_array($date['Tarification']['HScode']['Precision_1'])? $h_scode_precision_1 = json_encode($date['Tarification']['HScode']['Precision_1']) : $h_scode_precision_1 = $date['Tarification']['HScode']['Precision_1'];;

        }

        if(isset($date['Tarification']['HScode']) && isset($date['Tarification']['HScode']['Precision_2'])){
            $insertTarif.= ', h_scode_precision_2';
            $insertTarifVal .=', :h_scode_precision_2';
            is_array($date['Tarification']['HScode']['Precision_2'])? $h_scode_precision_2 = json_encode($date['Tarification']['HScode']['Precision_2']): $h_scode_precision_2 = $date['Tarification']['HScode']['Precision_2'];

        }

        if(isset($date['Tarification']['HScode']) && isset($date['Tarification']['HScode']['Precision_3'])){
            $insertTarif.= ', h_scode_precision_3';
            $insertTarifVal .=', :h_scode_precision_3';
            is_array($date['Tarification']['HScode']['Precision_3']) ? $h_scode_precision_3 = json_encode($date['Tarification']['HScode']['Precision_3']):$h_scode_precision_3 = $date['Tarification']['HScode']['Precision_3'];

        }

        if(isset($date['Tarification']['HScode']) && isset($date['Tarification']['HScode']['Precision_4'])){
            $insertTarif.= ', h_scode_precision_4';
            $insertTarifVal .=', :h_scode_precision_4';
            is_array($date['Tarification']['HScode']['Precision_4'])? $h_scode_precision_4 = json_encode($date['Tarification']['HScode']['Precision_4']):$h_scode_precision_4 = $date['Tarification']['HScode']['Precision_4'];

        }

        if(isset($date['Tarification']) && isset($date['Tarification']['Extended_customs_procedure'])){
            $insertTarif.= ', extended_customs_procedure';
            $insertTarifVal .=', :extended_customs_procedure';
            is_array($date['Tarification']['Extended_customs_procedure'])? $extended_customs_procedure = json_encode($date['Tarification']['Extended_customs_procedure']): $extended_customs_procedure = $date['Tarification']['Extended_customs_procedure'];

        }
        if(isset($date['Tarification']) && isset($date['Tarification']['National_customs_procedure'])){
            $insertTarif.= ', national_customs_procedure';
            $insertTarifVal .=', :national_customs_procedure';
            is_array($date['Tarification']['National_customs_procedure'])? $national_customs_procedure = json_encode($date['Tarification']['National_customs_procedure']): $national_customs_procedure = $date['Tarification']['National_customs_procedure'];

        }

        if(isset($date['Tarification']['Supplementary_unit']) && isset($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_code'])){
            $insertTarif.= ', supplementary_unit_code';
            $insertTarifVal .=', :supplementary_unit_code';
            is_array($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_code'])? $supplementary_unit_code = json_encode($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_code']):$supplementary_unit_code = $date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_code'];

        }
        if(isset($date['Tarification']['Supplementary_unit']) && isset($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_name'])){
            $insertTarif.= ', supplementary_unit_name';
            $insertTarifVal .=', :supplementary_unit_name';
            is_array($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_name'])? $supplementary_unit_name = json_encode($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_name']):$supplementary_unit_name = $date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_name'];

        }
        if(isset($date['Tarification']['Supplementary_unit']) && isset($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'])){
            $insertTarif.= ', supplementary_unit_quantity';
            $insertTarifVal .=', :supplementary_unit_quantity';
            is_array($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'])? $supplementary_unit_quantity = json_encode($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity']): $supplementary_unit_quantity = $date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'];

        }

        /*if(isset($date['Tarification']['Supplementary_unit']) && isset($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'])){
            $insertTarif.= ', supplementary_unit_quantity';
            $insertTarifVal .=', :supplementary_unit_quantity';
            is_array($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'])? $supplementary_unit_quantity = json_encode($date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity']): $supplementary_unit_quantity = $date['Tarification']['Supplementary_unit'][0]['Supplementary_unit_quantity'];

        }*/
        $insertTarif .= $insertTarifVal . ')';

        $newTarif = $connection->prepare($insertTarif);

        $newTarif->bindParam('item_id', $itemId);
        isset($h_scode_commodity_code)? $newTarif->bindParam(':h_scode_commodity_code', $h_scode_commodity_code, PDO::PARAM_STR) :'';
        isset($h_scode_precision_1)? $newTarif->bindParam(':h_scode_precision_1', $h_scode_precision_1, PDO::PARAM_STR):'';
        isset($h_scode_precision_2)? $newTarif->bindParam(':h_scode_precision_2', $h_scode_precision_2, PDO::PARAM_STR):'';
        isset($h_scode_precision_3)? $newTarif->bindParam(':h_scode_precision_3', $h_scode_precision_3, PDO::PARAM_STR):'';
        isset($h_scode_precision_4)? $newTarif->bindParam(':h_scode_precision_4', $h_scode_precision_4, PDO::PARAM_STR):'';
        isset($extended_customs_procedure)? $newTarif->bindParam(':extended_customs_procedure', $extended_customs_procedure, PDO::PARAM_STR):'';
        isset($national_customs_procedure)? $newTarif->bindParam(':national_customs_procedure', $national_customs_procedure, PDO::PARAM_STR):'';
        isset($supplementary_unit_code)? $newTarif->bindParam(':supplementary_unit_code', $supplementary_unit_code, PDO::PARAM_STR):'';
        isset($supplementary_unit_name)? $newTarif->bindParam(':supplementary_unit_name', $supplementary_unit_name, PDO::PARAM_STR):'';
        isset($supplementary_unit_quantity)? $newTarif->bindParam(':supplementary_unit_quantity', $supplementary_unit_quantity, PDO::PARAM_STR):'';

        $newTarif->execute();

        $newTarifid = (int)$connection->lastInsertId();
        try{

            $connection->commit();

        }catch (Exception $e){
            //todo add inf in log
        };


    }

    return $itemId;

}