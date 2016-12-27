<?php
/**
 * Created by PhpStorm.
 * User: parem
 * Date: 12/27/16
 * Time: 9:08 PM
 */
$itemsCoun = $_GET['items'];
include ('headet.php');
?>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>items count <?= $itemsCoun ?></p>
                <button class="btn btn-default">Export to MAH</button>
            </div>
        </div>
    </div>
<?php
include ('footer.php');
?>