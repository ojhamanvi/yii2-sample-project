<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Congratulations!<br> <?php print_r(Yii::$app->user->identity->name); ?></h1>

        <p class="lead">You have successfully created your Yii-powered application.</p>

        <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p>
    </div>

    <div class="body-content">

        <div class="row">
            <h1>All User Deatils</h1>
            <div class="col-lg-6">
            <?php if($user->data){
                foreach($user->data as $usr){?>
                <p>Name:<?= $usr->name; ?></p>
                <p>Email:<?= $usr->email; ?></p>
                    <hr>
            <?php }} ?>

            </div>
        </div>

    </div>
</div>
