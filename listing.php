<?php
/**
 * Created by PhpStorm.
 * User: parem
 * Date: 12/19/16
 * Time: 11:25 PM
 */
include_once ('headet.php');
?>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form action="tax-calculate.php" method="post" enctype="multipart/form-data">
                <div class="form-control">
                    <div class="form-group">
                        <label>xml</label>
                        <input type="file" name="fileToUpload" required="required" >
                        <span id="helpBlock" class="help-block">Please chose your XML file</span>
                    </div>
                    <button type="submit" class="btn btn-default" onclick="login()">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php
include_once ('footer.php');
?>
