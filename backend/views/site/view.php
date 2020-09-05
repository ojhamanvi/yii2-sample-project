
<?php 
use yii\helpers\Url;
$detail = $model->getUserDetail();

?>

<div class="row">
    <div class="col-lg-6">
        <p>Name: <?= $detail['name'] ?></p><hr> 
        <p>Username: <?= $detail['username'] ?></p><hr> 
        <p>Contact Numebr: <?= $detail['contact_number'] ?></p><hr> 
        <p>Email address: <?= $detail['email'] ?></p><hr> 
        <p>Profile Pic: <img src="<?= Url::base(true) ?>/images/users/<?= $detail['profile_pic'] ?> " width='100' height='100'></p><hr> 
        </div>
        <div class="col-lg-6">
        <p>Dob: <?= $detail['dob'] ?></p><hr> 
        <p>Address: <?= $detail['address'] ?></p><hr> 
        <p>City: <?= $detail['city'] ?></p><hr> 
        <p>State: <?= $detail['state'] ?></p><hr> 
        <p>Country: <?= $detail['country'] ?></p>
        
    </div>
</div>